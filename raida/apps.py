from django.apps import AppConfig


class RaidaConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'raida'

    def ready(self):
        # Import signals to register them
        import raida.signals  # noqa
