from django.urls import path, include
from rest_framework.routers import DefaultRouter
from . import views

# Create router for ViewSets
router = DefaultRouter()
router.register(r'lessons', views.LessonViewSet, basename='lesson')

urlpatterns = [
    # Health check - equivalent to Flask GET /
    path('', views.health_check, name='health_check'),
    
    # Auth endpoints (before router to avoid conflicts)
    path('auth/register/', views.register, name='register'),
    path('auth/login/', views.login, name='login'),
    path('auth/logout/', views.logout, name='logout'),
    path('auth/me/', views.me, name='me'),
    path('auth/refresh/', views.refresh_token, name='refresh_token'),
    
    # Lesson endpoints (BEFORE router to avoid {pk} conflicts)
    # IMPORTANT: These must come before the router's lessons/{pk}/ pattern
    path('lessons/upload/', views.upload_lesson, name='upload_lesson'),
    path('lessons/upload-json/', views.upload_lesson_json, name='upload_lesson_json'),
    path('lessons/generate/', views.generate_from_upload, name='generate_from_upload'),
    path('lessons/<int:lesson_id>/generate/', views.generate_from_id, name='generate_from_id'),
    path('lessons/pdf/<str:filename>/', views.download_pdf, name='download_pdf'),
    
    # Teacher info - equivalent to Flask GET/POST /teacher-info
    path('teacher-info/', views.teacher_info, name='teacher_info'),
    
    # Cache - equivalent to Flask GET /cache/stats and POST /cache/clear
    path('cache/stats/', views.cache_stats, name='cache_stats'),
    path('cache/clear/', views.clear_cache_view, name='clear_cache'),
    
    # Include router URLs LAST (catches remaining /lessons/ patterns)
    path('', include(router.urls)),
]
