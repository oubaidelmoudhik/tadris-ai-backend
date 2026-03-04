"""
Hashing utilities for lesson deduplication.
Provides deterministic hash generation based on lesson attributes.
"""
import hashlib
from typing import Optional


def generate_lesson_hash(
    title: str,
    subject: str,
    level: str,
    period: str,
    week: str,
    session: str
) -> str:
    """
    Generate a deterministic SHA256 hash for a lesson based on its core attributes.
    
    Uses only the structural fields (not content or filename) to ensure:
    - Same lesson data = same hash (idempotent)
    - Content updates don't create duplicates
    - Hash is stable across different import methods
    
    Args:
        title: Lesson title
        subject: Subject (français, mathématiques, langue arabe)
        level: Education level (1-6)
        period: Period/semester number
        week: Week number
        session: Session/seance number
    
    Returns:
        64-character hexadecimal SHA256 hash string
    """
    # Normalize empty strings to ensure consistent hashing
    def normalize(value: str) -> str:
        return (value or '').strip().lower()
    
    # Build deterministic string from core lesson attributes
    hash_input = '|'.join([
        normalize(title),
        normalize(subject),
        normalize(level),
        normalize(period),
        normalize(week),
        normalize(session)
    ])
    
    # Generate SHA256 hash
    return hashlib.sha256(hash_input.encode('utf-8')).hexdigest()


def is_valid_hash(hash_string: str) -> bool:
    """
    Validate that a string is a valid lesson hash.
    
    Args:
        hash_string: String to validate
    
    Returns:
        True if valid 64-character hex string
    """
    if not hash_string or not isinstance(hash_string, str):
        return False
    
    if len(hash_string) != 64:
        return False
    
    try:
        int(hash_string, 16)
        return True
    except ValueError:
        return False
