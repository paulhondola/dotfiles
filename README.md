# MacOS Dotfiles

A collection of dotfiles and setup scripts to automate the configuration of a new MacOS environment. This repository uses [GNU Stow](https://www.gnu.org/software/stow/) for symlink management and includes a setup script for system bootstrapping.

## Quick Start (Fresh Install)

To bootstrap a new machine, clone this repository and run the setup script:

```bash
# Clone the repository
git clone https://github.com/paulhondola/dotfiles.git ~/dotfiles

# Run the setup script
cd ~/dotfiles
./setup_macos.sh
```

### What `setup_macos.sh` does:

1.  **System Updates**: Updates macOS software.
2.  **Rosetta**: Installs Rosetta 2 for Apple Silicon compatibility.
3.  **Homebrew**: Installs Homebrew non-interactively.
4.  **Environment**: Configures shell environment for Homebrew.
5. **Packages**: Runs `brew bundle` (requires a `.Brewfile` in the root directory).
6. **Dotfiles**: Symlinks all configuration directories using `stow --adopt` (adopts existing files).
7. **Wallpaper**: Downloads and sets a custom wallpaper.

---

## 📂 Structure

| Directory        | Description                                            |
| :--------------- | :----------------------------------------------------- |
| `setup_macos.sh` | Main bootstrapping script.                             |
| `scripts/`       | Utility scripts for maintenance and automation.        |
| `zsh/`           | Zsh configuration (`.zshrc`, `.p10k.zsh`).             |
| `git/`           | Git global configuration (`.gitconfig`, `.gitignore`). |
| `homebrew/`      | Homebrew bundle file (`.Brewfile`).                    |

---

## Configuration Management (GNU Stow)

Use `stow` to symlink configuration files from this repository to your home directory.

### Managing Configurations

To install a configuration package (e.g., `zsh`):

```bash
cd ~/dotfiles
stow zsh
```

To remove a configuration (unstow):

```bash
cd ~/dotfiles
stow -D zsh
```

### Adopt Existing Files

If you have existing config files that conflict with the dotfiles, you can adopt them into the repo:

1. **Create package folder**: `mkdir -p ~/dotfiles/bash`
2. **Move file**: `mv ~/.bashrc ~/dotfiles/bash/`
3. **Stow with adopt**:

    ```bash
    cd ~/dotfiles
    stow --adopt bash
    ```

### Restore configs from backup

To manually restore specific configs (example for `.zshrc`):

```bash
# 1. Provide a clean slate (optional, be careful)
rm ~/.zshrc

# 2. Stow existing config
cd ~/dotfiles
stow zsh
```

---

## Utility Scripts

Located in `scripts/`:

### `scripts/brew.sh`

Performs full Homebrew maintenance: updates, upgrades, cleanup, autoremove, and dumps the current state to a global Brewfile.

```bash
./scripts/brew.sh
```

### `scripts/git.sh`

Iterates through `~/Faculta` and `~/Developer` directories and runs `git pull` on every subdirectory that is a git repository.

```bash
./scripts/git.sh
```

### `scripts/metal.sh`

Toggles the macOS Metal Performance HUD.

```bash
# Enable HUD
./scripts/metal.sh 1

# Disable HUD
./scripts/metal.sh 0
```
