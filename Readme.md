# Love-Configuration

Personal Windows dotfiles and desktop setup for a tiling workflow with **Komorebi + WHKD + YASB**, plus shell and terminal customization.

## What’s inside

- `profile.ps1` — PowerShell profile entry point.
- `starship.toml` — Starship prompt theme (powerline style with language/runtime modules).
- `whkdrc` — Keyboard shortcuts for window management and workspace actions.
- `komorebi/` — Komorebi-related configuration files.
- `yasb/` — YASB bar config, theme, styles, and logs.
- `cava/` — Audio visualizer config, themes, and shaders.
- `fastfetch/` — Fastfetch config and custom ASCII logo.
- `shell_gpt/` — ShellGPT roles and functions.
- `kilo/`, `simple-update-notifier/` — Additional utility/tool configs.

## Core stack

- **Window manager:** Komorebi
- **Hotkey daemon:** WHKD
- **Status bar:** YASB
- **Prompt:** Starship
- **System fetch:** Fastfetch
- **Font recommendation:** Nerd Font (JetBrains Mono Nerd Font works well)

## Quick start

1. Clone this repository to your config path:
   - `C:\Users\<YourUser>\.config`
2. Install required tools:
   - Komorebi
   - WHKD
   - YASB (>= 1.7.9)
   - Starship
   - Fastfetch
3. Install a Nerd Font (for glyph/icons in bar and prompt).
4. Launch/reload components:
   - Komorebi + WHKD (or use your startup script)
   - YASB
   - PowerShell (to load `profile.ps1` and Starship)

## Notes

- `yasb/config.yaml` contains weather settings. Replace API key/location with your own values.
- `whkdrc` includes Vim-style focus/move bindings (`Alt+h/j/k/l`) and workspace hotkeys (`Alt+1..8`).
- `starship.toml` uses a segmented color prompt with git, language, docker, and time modules.

## Customization tips

- **Bar layout/widgets:** edit `yasb/config.yaml`
- **Bar appearance:** edit `yasb/styles.css` and `yasb/theme.json`
- **Keybindings:** edit `whkdrc`
- **Prompt theme:** edit `starship.toml`
- **Fastfetch output:** edit `fastfetch/config.jsonc` and `fastfetch/ascii.txt`

## License

Personal configuration repository. Add a license file if you plan to distribute or reuse publicly.
