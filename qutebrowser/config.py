# ~/.config/qutebrowser/config.py
# Qutebrowser user configuration.
#
# Author: Nathan Campos <nathanpc@dreamintech.net>


# Home page.
c.url.start_pages = "https://qutebrowser.org/index.html"

# Session.
c.auto_save.interval = 120000
c.auto_save.session = True
c.session.default_name = "main"

# Aliases.
c.aliases = {
    "w": "session-save --current --only-active-window",
    "q": "quit",
    "wq": "quit --save"
}

# Search engines.
c.url.searchengines = {
    "DEFAULT": "https://google.com/search?q={}"
}

# Ignore all those silly tracking parameters when yanking.
c.url.yank_ignored_parameters = ["ref", "utm_source", "utm_medium", "utm_campaign", "utm_term", "utm_content"]

# Content.
c.content.default_encoding = "iso-8859-1"
c.content.geolocation = "ask"
c.content.pdfjs = True
c.content.plugins = True
c.content.webgl = True

# Editor.
c.editor.command = ["gvim", "-f", "{}"]
c.editor.encoding = "utf-8"

# Window title.
c.window.title_format = "{perc}{title}{title_sep}qutebrowser"

# Input.
c.input.insert_mode.auto_leave = True
c.input.insert_mode.auto_load = True
c.input.insert_mode.plugins = True


# Color scheme.

# base16-qutebrowser (https://github.com/theova/base16-qutebrowser)
# Base16 qutebrowser template by theova
# Modified by Nathan Campos.
# Tomorrow Night scheme by Chris Kempson (http://chriskempson.com)

base00 = "#1d1f21"
base01 = "#282a2e"
base02 = "#373b41"
base03 = "#969896"
base04 = "#b4b7b4"
base05 = "#c5c8c6"
base06 = "#e0e0e0"
base07 = "#ffffff"
base08 = "#cc6666"
base09 = "#de935f"
base0A = "#f0c674"
base0B = "#b5bd68"
base0C = "#8abeb7"
base0D = "#81a2be"
base0E = "#b294bb"
base0F = "#a3685a"

# Completion colors.
c.colors.completion.fg = base05
c.colors.completion.odd.bg = base01
c.colors.completion.even.bg = base00
c.colors.completion.category.fg = base0A
c.colors.completion.category.bg = base00
c.colors.completion.category.border.top = base00
c.colors.completion.category.border.bottom = base00
c.colors.completion.item.selected.fg = base01
c.colors.completion.item.selected.bg = base0A
c.colors.completion.item.selected.border.top = base0A
c.colors.completion.item.selected.border.bottom = base0A
c.colors.completion.match.fg = base0B
c.colors.completion.scrollbar.fg = base05
c.colors.completion.scrollbar.bg = base00

# Download colors.
c.colors.downloads.bar.bg = base00
c.colors.downloads.start.fg = base00
c.colors.downloads.start.bg = base0D
c.colors.downloads.stop.fg = base00
c.colors.downloads.stop.bg = base0C
c.colors.downloads.error.fg = base08

# Hint colors.
c.colors.hints.fg = base00
c.colors.hints.bg = base0A
c.colors.hints.match.fg = base05

# Key hint colors.
c.colors.keyhint.fg = base05
c.colors.keyhint.suffix.fg = base05
c.colors.keyhint.bg = base00

# Message colors.
c.colors.messages.error.fg = base00
c.colors.messages.error.bg = base08
c.colors.messages.error.border = base08
c.colors.messages.warning.fg = base00
c.colors.messages.warning.bg = base0E
c.colors.messages.warning.border = base0E
c.colors.messages.info.fg = base05
c.colors.messages.info.bg = base00
c.colors.messages.info.border = base00

# Prompt colors.
c.colors.prompts.fg = base05
c.colors.prompts.border = base00
c.colors.prompts.bg = base00
c.colors.prompts.selected.bg = base0A

# Status bar colors.
c.colors.statusbar.normal.fg = base0B
c.colors.statusbar.normal.bg = base00
c.colors.statusbar.insert.fg = base00
c.colors.statusbar.insert.bg = base0B
c.colors.statusbar.passthrough.fg = base00
c.colors.statusbar.passthrough.bg = base0C
c.colors.statusbar.private.fg = base00
c.colors.statusbar.private.bg = base03
c.colors.statusbar.command.fg = base05
c.colors.statusbar.command.bg = base00
c.colors.statusbar.command.private.fg = base05
c.colors.statusbar.command.private.bg = base00
c.colors.statusbar.caret.fg = base00
c.colors.statusbar.caret.bg = base0E
c.colors.statusbar.caret.selection.fg = base00
c.colors.statusbar.caret.selection.bg = base0D
c.colors.statusbar.progress.bg = base0D
c.colors.statusbar.url.fg = base05
c.colors.statusbar.url.error.fg = base08
c.colors.statusbar.url.hover.fg = base05
c.colors.statusbar.url.success.http.fg = base0C
c.colors.statusbar.url.success.https.fg = base0B
c.colors.statusbar.url.warn.fg = base0E

# Tab colors.
c.colors.tabs.bar.bg = base00
c.colors.tabs.indicator.start = base0D
c.colors.tabs.indicator.stop = base0C
c.colors.tabs.indicator.error = base08
c.colors.tabs.odd.fg = base05
c.colors.tabs.odd.bg = base00
c.colors.tabs.even.fg = base05
c.colors.tabs.even.bg = base00
c.colors.tabs.selected.odd.fg = base07
c.colors.tabs.selected.odd.bg = base02
c.colors.tabs.selected.even.fg = base07
c.colors.tabs.selected.even.bg = base02

# c.colors.webpage.bg = base00
