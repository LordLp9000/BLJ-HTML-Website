import os
import re
from pathlib import Path
import pytest
import logging

# Testing framework note:
# Using pytest (test discovery via tests/ and test_*.py naming). These tests are pytest-native.

REPO_ROOT = Path(__file__).resolve().parent.parent

# Distinctive selectors from the diff we will use to locate the CSS file under test.
SIGNATURE_SELECTORS = [
    r"\.goat-showcase",
    r"\.slide-menu",
    r"\.hamburger-menu",
    r"\.ranking-filters",
    r"\.dot\.active",
]

def find_target_css_files():
    # Prefer repo CSS files; scan for our signature selectors.
    css_files = list(REPO_ROOT.rglob("*.css"))
    hits = []
    patt = re.compile("|".join(SIGNATURE_SELECTORS))
    for f in css_files:
        try:
            txt = f.read_text(encoding="utf-8", errors="ignore")
        except OSError as e:
            logging.warning(f"Could not read file {f}: {e}")
            continue
        if patt.search(txt):
            hits.append(f)
    return hits

@pytest.fixture(scope="session")
def css_path():
    hits = find_target_css_files()
    if not hits:
        pytest.skip("No CSS file containing expected diff selectors found in repository.")
    # If multiple hits, prefer shortest path (likely project asset) for deterministic choice.
    hits.sort(key=lambda p: len(str(p)))
    return hits[0]

@pytest.fixture
def css_text(css_path):
    return css_path.read_text(encoding="utf-8", errors="ignore")

def _selector_block(text, selector, *, within_media=None):
    """
    Return the CSS block content (inside {...}) for a selector.
    If within_media is provided (string like '@media (max-width: 768px)'), limit search within that media block.
    This is a tolerant regex-based extractor; not a full CSS parser.
    """
    src = text
    if within_media:
        # Capture content within a specific @media block
        media_re = re.compile(rf"{re.escape(within_media)}\s*\{{(?P<body>.*?)\n\}}", re.S)
        m_media = media_re.search(src)
        if not m_media:
            return None
        src = m_media.group("body")

    # Find the selector block content
    # Pattern tolerates whitespace/newlines and additional selectors separated by commas.
    sel = re.escape(selector)
    block_re = re.compile(rf"{sel}\s*\{{(?P<body>.*?)\}}", re.S)
    m = block_re.search(src)
    return m.group("body") if m else None

def _has_decl(block, prop, value=None):
    """
    Check if a declaration for prop exists in block. If value provided, ensure it matches (case-insensitive, whitespace-tolerant).
    """
    if not block:
        return False
    # Build regex for property: prop: value;
    if value is None:
        patt = re.compile(rf"^\s*{re.escape(prop)}\s*:", re.M | re.I)
        return bool(patt.search(block))
    # Tolerate extra spaces, and optional \!important
    v = re.escape(value)
    patt = re.compile(rf"^\s*{re.escape(prop)}\s*:\s*{v}(?:\s*\!important)?\s*;", re.M | re.I)
    return bool(patt.search(block))

def test_global_reset_and_body_colors(css_text):
    # * { box-sizing: border-box; margin: 0; padding: 0; }
    star_block = _selector_block(css_text, "*")
    assert star_block, "Global * reset block should exist."
    assert _has_decl(star_block, "box-sizing", "border-box")
    assert _has_decl(star_block, "margin", "0")
    assert _has_decl(star_block, "padding", "0")

    body_block = _selector_block(css_text, "body")
    assert body_block, "body block should exist."
    assert _has_decl(body_block, "background-color", "#282727")
    assert _has_decl(body_block, "color", "white")
    assert _has_decl(body_block, "line-height", "1.6")

def test_header_is_fixed_with_shadow_and_zindex(css_text):
    header = _selector_block(css_text, "header")
    assert header, "header block should exist."
    assert _has_decl(header, "position", "fixed")
    assert _has_decl(header, "width", "100%")
    assert _has_decl(header, "top", "0")
    assert _has_decl(header, "z-index", "1000")
    assert _has_decl(header, "background-color", "#0004ff")
    # shadow presence (value may vary slightly); only assert the property name
    assert _has_decl(header, "box-shadow")

def test_slide_menu_closed_and_open_states(css_text):
    base = _selector_block(css_text, ".slide-menu")
    assert base, ".slide-menu block should exist."
    assert _has_decl(base, "left", "-350px")
    assert _has_decl(base, "transition")
    assert _has_decl(base, "position", "fixed")

    opened = _selector_block(css_text, ".slide-menu.open")
    assert opened, ".slide-menu.open block should exist."
    assert _has_decl(opened, "left", "0")

def test_menu_overlay_visibility_toggle(css_text):
    overlay = _selector_block(css_text, ".menu-overlay")
    assert overlay, ".menu-overlay block should exist."
    assert _has_decl(overlay, "display", "none")

    overlay_show = _selector_block(css_text, ".menu-overlay.show")
    assert overlay_show, ".menu-overlay.show block should exist."
    assert _has_decl(overlay_show, "display", "block")

def test_dropdown_and_hover_styles(css_text):
    dd = _selector_block(css_text, ".dropdown-content")
    assert dd, ".dropdown-content block should exist."
    assert _has_decl(dd, "background-color", "#0004ff")
    # Ensure anchor styles exist and hovered overrides
    dd_a = _selector_block(css_text, ".dropdown-content a")
    assert dd_a, "Anchors within dropdown-content should be styled."
    assert _has_decl(dd_a, "color")  # value is forced to white
    dd_a_hover = _selector_block(css_text, ".dropdown-content a:hover")
    assert dd_a_hover, "Hover style for dropdown-content anchors should exist."
    assert _has_decl(dd_a_hover, "background-color", "#ffbf00")
    assert _has_decl(dd_a_hover, "color", "#0004ff")

def test_page_section_toggling_and_slides(css_text):
    sec = _selector_block(css_text, ".page-section")
    assert sec and _has_decl(sec, "display", "none")
    sec_active = _selector_block(css_text, ".page-section.active")
    assert sec_active and _has_decl(sec_active, "display", "block")

    slide = _selector_block(css_text, ".slide")
    assert slide and _has_decl(slide, "display", "none")
    slide_active = _selector_block(css_text, ".slide.active")
    assert slide_active and _has_decl(slide_active, "display", "block")

def test_buttons_and_inputs_focus_and_hover(css_text):
    # Filter button active gradient and color flip
    active = _selector_block(css_text, ".filter-btn.active")
    assert active, ".filter-btn.active styles should exist."
    assert _has_decl(active, "color", "#0004ff")
    # Input focus border highlight
    inp_focus = _selector_block(css_text, ".input-group input:focus")
    assert inp_focus and _has_decl(inp_focus, "border-color", "#ffbf00")
    # CTA hover has transform and shadow
    cta_hover = _selector_block(css_text, ".cta-button:hover")
    assert cta_hover and _has_decl(cta_hover, "box-shadow")

def test_navigation_arrows_and_dots(css_text):
    arrows = _selector_block(css_text, ".prev, .next")
    assert arrows, "Navigation arrows (.prev, .next) style block should exist."
    assert _has_decl(arrows, "user-select", "none")
    assert _has_decl(arrows, "position", "absolute")

    dot_active = _selector_block(css_text, ".dot.active")
    assert dot_active and _has_decl(dot_active, "background-color", "#ffbf00")
    dot_hover = _selector_block(css_text, ".dot:hover")
    assert dot_hover and _has_decl(dot_hover, "background-color", "#ffbf00")

def test_keyframes_fade_in_declared(css_text):
    # Keyframes presence; tolerate whitespace/line breaks
    assert re.search(r"@keyframes\s+fadeIn\s*\{", css_text), "fadeIn keyframes should be declared."
    assert re.search(r"from\s*\{[^}]*opacity\s*:\s*0", css_text, re.S), "fadeIn 'from' should set opacity to 0."
    assert re.search(r"to\s*\{[^}]*opacity\s*:\s*1", css_text, re.S), "fadeIn 'to' should set opacity to 1."

def test_mobile_media_query_rules(css_text):
    media = "@media (max-width: 768px)"
    # .nav-links default hidden and shown under .nav-links.show
    nav_links = _selector_block(css_text, ".nav-links", within_media=media)
    assert nav_links, "Within mobile media query, .nav-links should have overrides."
    # Show state
    show = _selector_block(css_text, ".nav-links.show", within_media=media)
    assert show and _has_decl(show, "display", "flex")

    dd_mobile = _selector_block(css_text, ".dropdown-content", within_media=media)
    assert dd_mobile and _has_decl(dd_mobile, "position", "static")
    assert _has_decl(dd_mobile, "display", "block")
    # Hero h1 font-size reduced
    hero_h1 = _selector_block(css_text, ".hero h1", within_media=media)
    assert hero_h1 and _has_decl(hero_h1, "font-size", "2rem")