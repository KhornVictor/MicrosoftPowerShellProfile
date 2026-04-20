# Love-Configuration

Personal Windows desktop and terminal setup focused on a tiling workflow:

- Komorebi for window management
- WHKD for keybindings
- YASB for the top bar
- Starship + PowerShell profile for shell UX
- Fastfetch + Cava for visuals

## Screenshot Source

This repo includes a YASB theme based on:

- Theme: Yasb 004
- Author: amnweb
- Upstream: https://github.com/amnweb/yasb

## Repository Layout

- profile.ps1: PowerShell profile, helper functions, startup banner, Fastfetch invocation
- starship.toml: prompt segments and symbols
- whkdrc: Komorebi hotkeys
- komorebi/: reserved for Komorebi-specific files
- yasb/: bar config, CSS, theme metadata, logs
- cava/: Cava config, themes, GLSL shaders
- fastfetch/: Fastfetch JSONC config and custom ASCII art
- shell_gpt/: ShellGPT roles, functions, local config
- python/: helper scripts and requirements
- kilo/: Kilo plugin config
- simple-update-notifier/: utility folder

## What Is Configured

### 1) PowerShell Profile

Defined in profile.ps1:

- Initializes Starship prompt
- Forces UTF-8 terminal encoding
- Runs Fastfetch with explicit config path
- Adds helper functions for navigation, web search, browser shortcuts, PDF opening, and custom scripts

Important note:

- The profile contains machine-specific paths (for example D:\... and C:\Users\Khorn Victor\...). Update these after cloning.

### 2) Starship Prompt

Defined in starship.toml:

- Multi-segment powerline style prompt
- Modules for git, runtimes (Java/Node/Rust/etc.), Docker context, and clock
- Requires Nerd Font glyph support

### 3) Komorebi + WHKD

Defined in whkdrc and referenced by yasb/config.yaml:

- Vim-style directional focus and move keys:
  - Alt+h/j/k/l focus
  - Alt+Shift+h/j/k/l move
- Workspace switching and sending windows across workspaces (1-8)
- Tiling operations (stack, resize, monocle, float, flip)
- Quick reload:
  - Alt+o reloads WHKD
  - Alt+Shift+o reloads Komorebi config

### 4) YASB Bar

Defined in yasb/config.yaml and yasb/styles.css:

- Top bar layout with left/center/right widget groups
- Komorebi workspaces integration
- Widgets for media, volume, language, GitHub notifications, weather, Cava, wallpaper gallery, power menu
- Includes commands that assume local app paths (Discord, Telegram, Viber, VS Code)

Important notes:

- Requires YASB >= 1.7.9
- Requires JetBrains Mono Nerd Font (Propo) or equivalent Nerd Font
- Weather widget needs your own API key and location
- GitHub widget expects a token from environment

### 5) Fastfetch

Defined in fastfetch/config.jsonc:

- Custom logo from fastfetch/ascii.txt
- Styled system modules and color palette
- Called automatically by profile.ps1 when fastfetch is installed

### 6) Cava

Defined in cava/config, cava/themes, and cava/shaders:

- Includes shader files for GLSL modes and theme files
- YASB Cava widget is enabled in the bar configuration

### 7) Python Helpers

Defined in python/:

- requirements.txt includes:
  - requests
  - colorama
- utility scripts in python/network and python/path

### 8) ShellGPT and Kilo

- shell_gpt/ contains local role and function JSON files for ShellGPT workflows
- kilo/ contains plugin and permission config for Kilo tooling

## Installation Guide (Windows)

## 0) Prerequisites

Install:

- Git
- PowerShell 7+
- Nerd Font (JetBrains Mono Nerd Font recommended)
- Winget (recommended package manager on Windows)

## 1) Clone Into .config

In PowerShell:

```powershell
cd $HOME
git clone https://github.com/KhornVictor/Love-Configuration.git .config
cd .config
```

If .config already exists:

```powershell
cd $HOME
git clone https://github.com/KhornVictor/Love-Configuration.git Love-Configuration
```

Then copy or merge the files you want.

## 2) Install Core Tools

Install each tool with Winget (package IDs can change over time, so search first if needed):

```powershell
winget search komorebi
winget search whkd
winget search yasb
winget search starship
winget search fastfetch
```

Then install the matching packages:

```powershell
winget install <komorebi-package-id>
winget install <whkd-package-id>
winget install <yasb-package-id>
winget install Starship.Starship
winget install Fastfetch-cli.Fastfetch
```

## 3) Set Up PowerShell Profile

If your PowerShell profile is not linked yet:

```powershell
if (!(Test-Path $PROFILE)) { New-Item -ItemType File -Path $PROFILE -Force }
notepad $PROFILE
```

Add this line to load the repo profile:

```powershell
. "$HOME/.config/profile.ps1"
```

Restart PowerShell.

## 4) Configure YASB

1. Open yasb/config.yaml.
2. Replace weather api_key with your own key.
3. Set weather location for your city.
4. Verify app launch paths in the apps widget.
5. Set GitHub token environment variable if you use the GitHub widget.

## 5) Configure Machine-Specific Paths

Edit profile.ps1 and update paths that are specific to one PC (for example D:\... folders, PDF base folder, local script locations).

Also review:

- python/path/go.py path aliases
- yasb wallpaper folder path
- any hardcoded app executable paths

## 6) Optional Python Environment

```powershell
cd $HOME/.config/python
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt
```

## 7) Start Services

Start Komorebi + WHKD:

```powershell
komorebic start --whkd
```

Start YASB (command depends on your installation method):

```powershell
yasb
```

Open a new PowerShell window to verify:

- Starship prompt is active
- Fastfetch runs
- profile functions are available

## 8) Auto-Start on Login (Recommended)

Use Windows Startup Apps, Task Scheduler, or startup scripts to launch:

- Komorebi (with WHKD)
- YASB
- Optional background utilities you use daily

## Verification Checklist

- PowerShell opens without errors
- Prompt icons render correctly (Nerd Font installed)
- komorebic commands work
- whkd hotkeys respond
- YASB loads and widgets update
- Weather widget returns live data
- GitHub widget reads notifications (if token configured)

## Security Notes

- Do not commit real API keys or personal tokens.
- Keep secrets in environment variables where possible.
- If any key was accidentally committed, rotate it immediately.

## Customization Quick Map

- Bar layout/widgets: yasb/config.yaml
- Bar style: yasb/styles.css
- Prompt: starship.toml
- Hotkeys: whkdrc
- Fastfetch: fastfetch/config.jsonc and fastfetch/ascii.txt
- Cava shaders/themes: cava/shaders and cava/themes
- PowerShell functions: profile.ps1

## License

Personal configuration repository. Add a license if you plan to redistribute.
