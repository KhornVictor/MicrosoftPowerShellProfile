# 💻 Terminal Profile & Configuration

A modern, fast, and feature-rich **PowerShell** profile tailored for **Windows Terminal**. Built for productivity, aesthetics, and seamless developer workflows.

---

## ✨ Features

- 🎨 **Dynamic Themes**: Integrates [Oh My Posh](https://ohmyposh.dev/) with 120+ selectable themes and a randomized theme on startup.
- 📊 **Hardware & Fastfetch Dashboard**: Displays system specs (CPU, GPU, RAM, SWAP, Disks) with custom ASCII art and [Fastfetch](https://github.com/fastfetch-cli/fastfetch).
- 🔍 **Interactive Search**: Integrated [fzf](https://github.com/junegunn/fzf) and `PSReadLine` history prediction in list view.
- ⚡ **Productivity Shortcuts**: Quick navigation, clipboard utilities, and custom shell commands.
- 🌐 **Web & Workflow Launchers**: One-command browser openers for GitHub, ChatGPT, Notion, Moodle, and Google/YouTube searches.
- 🐙 **Git Automation**: Simplified interactive commits and repository initializers.
- 🛠️ **Network Diagnostics**: Built-in ping, traceroute, DNS lookup, and active port inspections.

---

## ⚡ Useful Commands

| Command | Description |
| :--- | :--- |
| `theme [1-123]` | Switch Oh My Posh prompt theme interactively or by number |
| `initialize` | Re-run the hardware info dashboard and ASCII banner |
| `cpwd` | Copy current working directory path to clipboard |
| `push [message]` | Stage all changes, show status, prompt confirmation, and push to Git |
| `push_init <repo>` | Initialize a fresh Git repository, commit, and push to GitHub |
| `port <port>` | Find process name and PID currently listening on a port |
| `netdiag <host>` | Run combined network test (Ping, Traceroute, DNS lookup, Nmap) |
| `nemo <file>` | Mask file content on terminal while copying plain text to clipboard |
| `runNext` / `runNest` | Start dev server for Next.js (`npm run dev`) or NestJS projects |
| `vs` / `c` / `q` | Quick aliases for `code .`, `Clear-Host`, and `exit` |

---

## 📦 Prerequisites

To take full advantage of this configuration, install the following:

- **[PowerShell 7+](https://github.com/PowerShell/PowerShell)** (`pwsh`)
- **[Windows Terminal](https://github.com/microsoft/terminal)**
- **[Nerd Font](https://www.nerdfonts.com/)** (e.g., *MesloLGL Nerd Font* or *JetBrainsMono NF*)
- **[Oh My Posh](https://ohmyposh.dev/)**
- **[Fastfetch](https://github.com/fastfetch-cli/fastfetch)**
- PowerShell Modules:

  ```shell
  Install-Module -Name PSReadLine -Force
  Install-Module -Name PSFzf -Force
  ```

---

## 🚀 Setup & Installation

1. **Clone this repository**:

   ```shell
   git clone https://github.com/KhornVictor/Love-Configuration.git "$HOME\.config\terminal"
   ```

2. **Link to your PowerShell profile**:
   Add the following line to your `$PROFILE` (run `notepad $PROFILE` to edit):

    ```shell
    . "$HOME\.config\terminal\profile.ps1"
    ```

3. **Reload your profile**:

   ```shell
   . $PROFILE
   ```

---

## 📄 License

This project is licensed under the [MIT License](license.md).
