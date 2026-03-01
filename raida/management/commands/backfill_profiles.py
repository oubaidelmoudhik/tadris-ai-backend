"""
Management command to backfill UserProfile for existing users.
Run this after deploying the migration to create profiles for users
who existed before the UserProfile model was added.
"""
from django.core.management.base import BaseCommand
from django.contrib.auth.models import User
from raida.models import UserProfile


class Command(BaseCommand):
    help = 'Create UserProfile for existing users who do not have one'

    def handle(self, *args, **options):
        users_without_profile = User.objects.filter(profile__isnull=True)
        count = users_without_profile.count()

        if count == 0:
            self.stdout.write(self.style.SUCCESS('All users already have profiles.'))
            return

        for user in users_without_profile:
            UserProfile.objects.get_or_create(user=user)
            self.stdout.write(f'Created profile for user: {user.username}')

        self.stdout.write(self.style.SUCCESS(f'Successfully created {count} user profiles.'))
