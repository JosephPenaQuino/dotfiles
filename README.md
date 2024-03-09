# Joseph's Dotfiles

## Getting Started

### Prerequisites

Execute this command in order to execute dependencies:

```bash
sudo apt install -y tmux
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
config remote  set-url origin https://github.com/JosephPenaQuino/dotfiles.git
```

### Directory structure

Execute the commands below:

```bash
mkdir -p ~/programs
mkdir -p ~/projects
```

#### Alacritty

Follow the steps to install alacritty from [repository](https://github.com/alacritty/alacritty/blob/master/INSTALL.md),
but clone the repository in `~/programs`

### Installation


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

## Usage

## Roadmap
