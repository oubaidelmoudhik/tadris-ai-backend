"""
Management command to scan lessons folder for new PPTX files.
"""
import os
from django.core.management.base import BaseCommand
from django.conf import settings
from raida.services.pptx_service import extract_metadata_from_filename, extract_text_from_pptx
from raida.services.lesson_service import process_lesson_data


class Command(BaseCommand):
    help = 'Scan lessons folder for new PPTX files and import them'

    def add_arguments(self, parser):
        parser.add_argument(
            '--lessons-dir',
            type=str,
            default='lessons',
            help='Path to lessons directory (relative to backend directory)'
        )
        parser.add_argument(
            '--dry-run',
            action='store_true',
            help='Show what would be imported without actually importing'
        )
        parser.add_argument(
            '--delete-processed',
            action='store_true',
            help='Delete PPTX files after processing (to keep app light)'
        )

    def handle(self, *args, **options):
        lessons_dir = options['lessons_dir']
        dry_run = options['dry_run']
        delete_processed = options['delete_processed']
        
        # Resolve full path
        base_dir = getattr(settings, 'BASE_DIR', os.getcwd())
        lessons_path = os.path.join(base_dir, lessons_dir)
        
        self.stdout.write(f"Scanning: {lessons_path}")
        
        if not os.path.exists(lessons_path):
            self.stdout.write(self.style.WARNING(f"Directory not found: {lessons_path}"))
            return
        
        # Get all PPTX files
        pptx_files = [f for f in os.listdir(lessons_path) if f.endswith('.pptx')]
        
        if not pptx_files:
            self.stdout.write("No PPTX files found")
            return
        
        self.stdout.write(f"Found {len(pptx_files)} PPTX files")
        
        # Process each file
        imported = 0
        
        for filename in pptx_files:
            # Extract metadata and content
            pptx_path = os.path.join(lessons_path, filename)
            metadata = extract_metadata_from_filename(filename)
            content = extract_text_from_pptx(pptx_path)
            
            self.stdout.write(f"  Processing: {filename}")
            self.stdout.write(f"    Subject: {metadata['subject']}, Level: {metadata['level']}, Period: {metadata['period']}, Week: {metadata['week']}, Session: {metadata['session']}")
            
            if not dry_run:
                # Use centralized lesson service for deduplication
                lesson, created = process_lesson_data(
                    title=metadata['title'],
                    subject=metadata['subject'],
                    level=metadata['level'],
                    period=metadata['period'],
                    week=metadata['week'],
                    session=metadata['session'],
                    content=content,
                    filename=filename,  # Original filename stored for reference
                    objective="......"
                )
                
                if created:
                    self.stdout.write(f"    ✓ Created new lesson (ID: {lesson.id})")
                else:
                    self.stdout.write(f"    → Updated existing lesson (ID: {lesson.id})")
                
                # Delete processed file if flag is set
                if delete_processed:
                    try:
                        os.remove(pptx_path)
                        self.stdout.write(f"    Deleted: {filename}")
                    except Exception as e:
                        self.stdout.write(self.style.ERROR(f"    Error deleting {filename}: {e}"))
            
            imported += 1
        
        self.stdout.write("")
        self.stdout.write(self.style.SUCCESS(f"Summary:"))
        self.stdout.write(f"  Processed: {imported}")
        
        if dry_run:
            self.stdout.write(self.style.WARNING("Dry run - no changes made"))
