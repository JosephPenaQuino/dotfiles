# Joseph's Dotfiles

## Getting Started

### Prerequisites

Execute this command in order to execute dependencies:

```bash
sudo apt update
sudo apt install -y tmux git curl zsh zsh-syntax-highlighting xclip ripgrep

```

Initialize git for dotfiles following the procedure from [Atlassian](https://www.atlassian.com/git/tutorials/dotfiles):

```bash
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```

Then link the dotfiles git to this repository:

```
source ~/.bashrc
config remote  add origin https://github.com/JosephPenaQuino/dotfiles.git
```

### Directory structure

Execute the commands below:

```bash
mkdir -p ~/programs
mkdir -p ~/projects
```

### Installing Packages

#### Alacritty

Follow the steps to install alacritty from [repository](https://github.com/alacritty/alacritty/blob/master/INSTALL.md),
but clone the repository in `~/programs`

```bash
config submodule update --init --remote
# set as default
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/alacritty 50
sudo update-alternatives --config x-terminal-emulator
```

#### Pyenv

Follow the steps to install pyenv from [repository](https://github.com/pyenv/pyenv?tab=readme-ov-file#installation)

```bash
pyenv global 3.12
```


#### Oh-my-zsh

Follow the steps to install oh-my-zsh from [repository](https://ohmyz.sh/#install)

- https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
- https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
- https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#oh-my-zsh

#### Neovim

- https://github.com/neovim/neovim/releases
- https://github.com/wbthomason/packer.nvim?tab=readme-ov-file#quickstart

#### NVM

https://github.com/nvm-sh/nvm?tab=readme-ov-file#git-install

Then check in https://nodejs.org/en and install the latest version

```bash
nvm install vX.Y.Z
```

#### TMUX

This section is based on the [tmux plugin manager repository](https://github.com/tmux-plugins/tpm).
Go to the tmux file:

```
v ~/.tmux.conf
```

Execute <C-b><S-i> to install the plugins.

#### Fuzzy finder
In order to use the zsh fuzzy finder, you must clone their [repository](https://github.com/junegunn/fzf).
Rembember, install fzf from the repository instead of using the apt source.
the repository version is higher than the apt source.

## Grammarly

From https://hanspinckaers.com/use-grammarly-premium-with-grammarly-lsp-in-neovim/

Basically, I needed to login via VSCode, then I got it working.

1. Download / install VSCode (the horror..)
2. Install the extension Grammarly
3. Shift-Command-p --> grammarly.login
4. Follow the login flow
5. Quit VSCode
6. Check ls ~/.config/grammarly-languageserver
7. Copy the folder name, this is your clientID
8. Configure the LSP like this:

```
require'lspconfig'.grammarly.setup{
     on_attach = on_attach,
     init_options = { clientId = "<>" }
}
```

Getting TypeError: Failed to parse URL ? You may need to run using node v16.40:

- Install nvm (https://github.com/nvm-sh/nvm / https://github.com/jorgebucaran/nvm.fish)
- nvm install v16.14.0
- nvm use 16
- nvim


## Usage

## Roadmap
