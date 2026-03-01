from django.contrib import admin
from .models import Lesson, GeneratedPDF, TeacherInfo, UserProfile


@admin.register(Lesson)
class LessonAdmin(admin.ModelAdmin):
    list_display = ['title', 'subject', 'user', 'level', 'period', 'week', 'session', 'created_at']
    list_filter = ['subject', 'level', 'period', 'user']
    search_fields = ['title', 'content']
    readonly_fields = ['created_at', 'updated_at']


@admin.register(GeneratedPDF)
class GeneratedPDFAdmin(admin.ModelAdmin):
    list_display = ['lesson', 'user', 'filename', 'generated_at']
    list_filter = ['generated_at', 'user']
    readonly_fields = ['generated_at']


@admin.register(TeacherInfo)
class TeacherInfoAdmin(admin.ModelAdmin):
    list_display = ['user', 'updated_at']
    list_filter = ['user']


@admin.register(UserProfile)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = (
        'user',
        'plan',
        'pdf_generated_count',
        'pptx_uploaded_count',
        'last_pdf_generated_at',
        'last_upload_at',
    )
    list_filter = ['plan', 'is_active']
    search_fields = ['user__username', 'user__email']
    readonly_fields = ['created_at', 'updated_at']
