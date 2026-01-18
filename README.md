# Dotfiles

![chezmoi](https://img.shields.io/badge/chezmoi-enabled-blue)
![macos](https://img.shields.io/badge/macos-enabled-green)
![wsl](https://img.shields.io/badge/wsl-enabled-cyan)
![codespaces](https://img.shields.io/badge/codespaces-enabled-black)

Welcome to my dotfiles! These are my files that I run between mac OS,
Ubuntu, WSL, and GitHub codespaces.

I use [Homebrew](https://brew.sh) to manage dependencies across both systems
and manage the deps within a [Brewfile](./Brewfile).

## Quick Install

Install everything with a single command:

```bash
curl -fsSL https://raw.githubusercontent.com/achiurizo/dotfiles/main/bootstrap.sh | bash
```

This will:

- Install Homebrew (macOS/Linux)
- Install chezmoi
- Clone and apply dotfiles
- Install all dependencies from Brewfile
- Setup Python/Ruby via mise
- Configure tmux plugin manager

## Custom Features

This dotfiles setup focuses on modern CLI tools and vi-style workflow
consistency across all applications.

### Shell & Terminal

- **Vi-mode everywhere**: Consistent vi bindings in shell (readline), tmux,
  and Neovim
- **Modern CLI tools**: Uses `bat`, `fd`, `ripgrep` instead of traditional
  cat/find/grep
- **Homebrew environment**: Auto-configured for Linux/macOS with shell
  integration

### Git Workflow

- **Custom aliases**: `co` (checkout), `cm` (GPG-signed commit),
  `s` (compact status), `dm` (delete merged branches)
- **GPG signing**: Default commit alias includes automatic GPG signing
  (`git cm`)
- **Enhanced diff**: Custom pretty format with colors and relative timestamps
- **Project overrides**: Support for local `.gitconfig.local` files

### Tmux Configuration

- **Custom prefix**: Changed from Ctrl-B to Ctrl-A for easier access
- **Vi copy/paste**: Full vi-mode bindings for copy/selection
- **Quick reload**: `r` key reloads tmux configuration
- **Catppuccin theme**: Mocha flavor with custom status bar

### Neovim Customizations

- **Project configs**: Enables `.nvim.lua` for project-specific settings
- **Copilot integration**: Custom keybinds for buffer (`<leader>ab`) and
  visual selection (`<leader>av`) chat
- **Multiple colorschemes**: Extensive collection including Kanagawa,
  Rose Pine, OneDarkPro, etc.

### GitHub CLI

- **Custom aliases**: `co` (pr checkout), `readme` (markdown preview),
  `ci-status` (commit status)
- **Enhanced pager**: Uses `bat` for syntax highlighting

### Development Tools

- **Language management**: mise for Python/Ruby with automated pynvim
  installation
- **Modern alternatives**: fd, ripgrep, bat, fzf, gum for enhanced CLI
  experience
- **Git tools**: tig, universal-ctags for enhanced git workflow