"""
Predefined color palettes for PDF generation.
Each palette has 6 colors for exact frontend/PDF matching:
- main: Primary brand color (headers, card backgrounds)
- accent: Secondary color (metadata bar, highlights, icons)
- text_light: Text color ON dark/colored backgrounds (usually white)
- text_dark: Text color ON light backgrounds (usually dark gray)
- bg_light: Light background for content cards
- border: Subtle border color for cards
"""

from typing import Dict, Any


COLOR_PALETTES: Dict[str, Dict[str, str]] = {
    'professional': {
        'name': 'Professionnel',
        'name_fr': 'Professionnel',
        'name_ar': 'مهني',
        'main': '#1E40AF',        # Blue-800 - Trust, professionalism
        'accent': '#3B82F6',      # Blue-500 - Highlights, links
        'text_light': '#FFFFFF',   # White text on colored backgrounds
        'text_dark': '#1F2937',   # Gray-800 text on white backgrounds
        'bg_light': '#F9FAFB',     # Gray-50 for content cards
        'border': '#DBEAFE',       # Blue-200 for subtle borders
    },
    'vibrant': {
        'name': 'Vibrant',
        'name_fr': 'Vibrant',
        'name_ar': 'حيوي',
        'main': '#7C2D12',        # Orange-900 - Energy, warmth
        'accent': '#EA580C',      # Orange-600 - Highlights, icons
        'text_light': '#FFFFFF',  # White text on colored backgrounds
        'text_dark': '#1F2937',   # Gray-800 text on white backgrounds
        'bg_light': '#FFFBEB',    # Amber-50 for content cards
        'border': '#FED7AA',      # Orange-200 for borders
    },
    'calm': {
        'name': 'Calme',
        'name_fr': 'Calme',
        'name_ar': 'هادئ',
        'main': '#065F46',        # Emerald-800 - Calm, growth
        'accent': '#10B981',      # Emerald-500 - Highlights, icons
        'text_light': '#FFFFFF',  # White text on colored backgrounds
        'text_dark': '#1F2937',   # Gray-800 text on white backgrounds
        'bg_light': '#ECFDF5',    # Emerald-50 for content cards
        'border': '#A7F3D0',      # Emerald-200 for borders
    },
    'monotone': {
        'name': 'Monotone',
        'name_fr': 'Monotone',
        'name_ar': 'أحادي اللون',
        'main': '#374151',        # Gray-700 - Clean, minimal
        'accent': '#6B7280',      # Gray-500 - Subtle highlights
        'text_light': '#FFFFFF',  # White text on colored backgrounds
        'text_dark': '#111827',   # Gray-900 text on white backgrounds
        'bg_light': '#F3F4F6',    # Gray-100 for content cards
        'border': '#D1D5DB',      # Gray-300 for borders
    },
}

FONT_SIZE_CONFIG: Dict[str, Dict[str, str]] = {
    'small': {'base': '10px', 'title': '14px', 'heading': '12px'},
    'medium': {'base': '12px', 'title': '16px', 'heading': '14px'},
    'large': {'base': '14px', 'title': '18px', 'heading': '16px'},
}

LINE_HEIGHT_CONFIG: Dict[str, str] = {
    'compact': '1.3',
    'comfortable': '1.6',
}


def get_palette(preset_name: str) -> Dict[str, str]:
    """Get color palette by preset name."""
    return COLOR_PALETTES.get(preset_name, COLOR_PALETTES['professional'])


def get_font_config(font_size: str) -> Dict[str, str]:
    """Get font size config by preset name."""
    return FONT_SIZE_CONFIG.get(font_size, FONT_SIZE_CONFIG['medium'])


def get_line_height(line_height: str) -> str:
    """Get line height value by preset name."""
    return LINE_HEIGHT_CONFIG.get(line_height, LINE_HEIGHT_CONFIG['comfortable'])
