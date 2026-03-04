"""
Lesson Service - Centralized lesson processing pipeline.

This service provides a unified interface for creating/updating lessons
that works for both:
1. Local folder scanning (scan_lessons.py)
2. Web-based JSON uploads (API endpoint)

Ensures deterministic deduplication via hash-based detection.
"""
from typing import Optional, Tuple
from django.contrib.auth.models import User

from raida.models import Lesson
from raida.utils.hashing import generate_lesson_hash


def process_lesson_data(
    title: str,
    subject: str,
    level: str,
    period: str,
    week: str,
    session: str,
    content: str = "",
    filename: Optional[str] = None,
    user: Optional[User] = None,
    objective: str = "......"
) -> Tuple[Lesson, bool]:
    """
    Process lesson data - create new or return existing lesson.
    
    This is the single entry point for lesson creation/updating that:
    - Generates deterministic hash for deduplication
    - Checks if lesson already exists by hash
    - Updates existing lesson or creates new one
    - Returns (lesson, created_boolean) tuple
    
    Args:
        title: Lesson title
        subject: Subject (français, mathématiques, langue arabe)
        level: Education level (1-6)
        period: Period/semester number
        week: Week number
        session: Session/seance number
        content: Extracted text content from PPTX
        filename: Original filename (optional, will be set to hash if not provided)
        user: Django User instance (optional, defaults to system user)
        objective: Learning objective (defaults to "......")
    
    Returns:
        Tuple of (Lesson instance, created_boolean)
        - created=True if new lesson was created
        - created=False if existing lesson was returned
    
    Example:
        >>> lesson, created = process_lesson_data(
        ...     title="Les couleurs",
        ...     subject="français",
        ...     level="1",
        ...     period="1",
        ...     week="5",
        ...     session="2",
        ...     content="Full extracted text..."
        ... )
        >>> print(f"Lesson {'created' if created else 'already exists'}: {lesson.id}")
    """
    # Generate deterministic hash from core lesson attributes
    lesson_hash = generate_lesson_hash(
        title=title,
        subject=subject,
        level=level,
        period=period,
        week=week,
        session=session
    )
    
    # Use hash as filename if not provided (backward-compatible storage)
    # This allows both scan_lessons and web uploads to use the same detection
    storage_filename = filename if filename else lesson_hash
    
    # Check if lesson with same hash already exists
    # We check both by hash stored in filename AND by exact field match
    existing_by_hash = Lesson.objects.filter(filename=lesson_hash).first()
    
    if existing_by_hash:
        # Update content if new content provided (allows refresh without duplicate)
        if content and content != existing_by_hash.content:
            existing_by_hash.content = content
            existing_by_hash.save(update_fields=['content', 'updated_at'])
        return (existing_by_hash, False)
    
    # Also check by exact field match as fallback (for legacy data)
    existing_by_fields = Lesson.objects.filter(
        title__iexact=title,
        subject__iexact=subject,
        level__iexact=level,
        period__iexact=period,
        week__iexact=week,
        session__iexact=session
    ).first()
    
    if existing_by_fields:
        # Update hash storage and content
        existing_by_fields.filename = lesson_hash
        if content:
            existing_by_fields.content = content
        existing_by_fields.save(update_fields=['filename', 'content', 'updated_at'])
        return (existing_by_fields, False)
    
    # Determine user - use provided user or default system user
    lesson_user = user if user else get_default_lesson_user()
    
    # Create new lesson
    new_lesson = Lesson.objects.create(
        user=lesson_user,
        title=title,
        subject=subject,
        level=level,
        period=period,
        week=week,
        session=session,
        filename=lesson_hash,  # Store hash for deduplication
        objective=objective,
        content=content or ""
    )
    
    return (new_lesson, True)


def get_default_lesson_user() -> User:
    """
    Get or create the default system user for lessons.
    
    Returns:
        User instance for system-generated lessons
    """
    user, _ = User.objects.get_or_create(
        username='system',
        defaults={
            'email': 'system@raida.local',
            'is_active': False  # System user not login-capable
        }
    )
    return user


def get_lesson_by_hash(lesson_hash: str) -> Optional[Lesson]:
    """
    Retrieve a lesson by its hash.
    
    Args:
        lesson_hash: 64-character SHA256 hash
    
    Returns:
        Lesson instance if found, None otherwise
    """
    return Lesson.objects.filter(filename=lesson_hash).first()


def check_lesson_exists(
    title: str,
    subject: str,
    level: str,
    period: str,
    week: str,
    session: str
) -> Optional[Lesson]:
    """
    Check if a lesson with given attributes already exists.
    
    Args:
        title: Lesson title
        subject: Subject
        level: Education level
        period: Period number
        week: Week number
        session: Session number
    
    Returns:
        Existing Lesson instance if found, None otherwise
    """
    # First try by hash
    lesson_hash = generate_lesson_hash(title, subject, level, period, week, session)
    lesson = Lesson.objects.filter(filename=lesson_hash).first()
    
    if lesson:
        return lesson
    
    # Fallback: check by exact field match
    return Lesson.objects.filter(
        title__iexact=title,
        subject__iexact=subject,
        level__iexact=level,
        period__iexact=period,
        week__iexact=week,
        session__iexact=session
    ).first()
