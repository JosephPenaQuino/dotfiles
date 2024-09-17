# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL10k_MODE='awesome-fontconfig'
POWERLEVEL10k_MODE=(dir rbenv vcs)

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git-auto-fetch
	git
	zsh-autosuggestions
	git-flow
	gitignore
	colored-man-pages
	vi-mode
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
  export VISUAL='vim'
else
  export EDITOR='nvim'
  export VISUAL='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

GOTO_PATHS=""

export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.local/bin"

# ARM
export PATH="$PATH:$HOME/Programs/gcc-arm-none-eabi-9-2020-q2-update/bin"
export PATH="$PATH:$HOME/Programs/gcc-arm-10.2-2020.11-x86_64-arm-none-linux-gnueabihf/bin"
export PATH="$PATH:$HOME/STM32MPU_workspace/STM32MPU-Tools/STM32CubeProgrammer-x.y.z/bin"
export PATH="$PATH:/opt/gcc-arm-none-eabi-10-2020-q4-major/bin"
export PATH="$PATH:/opt/cross-gcc-8.3.0-pi_3+/cross-pi-gcc-8.3.0-2/bin"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup=$("${HOME}/anaconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${HOME}/anaconda3/etc/profile.d/conda.sh" ]; then
        . "${HOME}/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="${HOME}/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Valgrind
alias vg_mem='valgrind --leak-check=full -v --track-origins=yes'

# Set size
tabs 4

# Git
alias config="/usr/bin/git --git-dir=${HOME}/.cfg/ --work-tree=${HOME}"

# Cekeikon
alias get_cekeikon='source ~/cekeikon5/bin/ativa_cekcpu'

# Copy current path to clipboard
alias cpwd='pwd | xclip -selection clipboard'
source ~/.work_env 2> /dev/null
source ~/.personal_env 2> /dev/null

# ESP32
alias get_idf='. $HOME/tools/esp-idf-v4.4/export.sh'
alias get_idf_5='. $HOME/tools/esp-idf-release-v5.0/export.sh'
alias genEspIdfYcm='~/.vim/bundle/YCM-Generator/config_gen.py -c $(which xtensa-esp32-elf-gcc) --verbose --preserve-environment .'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND="fd --hidden"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"

fpath+=${ZDOTDIR:-~}/.zsh_functions

alias cmakegdb='cmake -DCMAKE_BUILD_TYPE=Debug ..'
alias cmakeclang='cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..'
alias cmakesanitizer='cmake .. -DCMAKE_CXX_FLAGS="-fsanitize=address  -fsanitize=leak -g" -DCMAKE_C_FLAGS="-fsanitize=address  -fsanitize=leak -g" -DCMAKE_EXE_LINKER_FLAGS="-fsanitize=address  -fsanitize=leak" -DCMAKE_MODULE_LINKER_FLAGS="-fsanitize=address  -fsanitize=leak"'

# Git shortchuts
alias gitl='git log --graph --reflog'
alias gitll='g log --oneline --decorate'
alias gits='git status'
alias gitd='git diff'
alias gitt='git --no-pager tag'
. ~/bin/goto

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias dps='docker ps -a --format "table {{.Image}}\t{{.Status}}\t{{.Names}}"'
alias git-sninppest='bat .oh-my-zsh/plugins/git/README.md'
alias t="tree -I 'venv|__pycache__|*.tar.gz|build*|*.npy'"

# zsh highlight
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Java
# export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre"
# export JAVA_HOME="/usr/lib/jvm/default-java/"
export JAVA_HOME="/usr/lib/java/jdk-17"

# Contiki
export CNG_PATH="${HOME}/tools/contiki-ng-43"
alias contiker="docker run --privileged --sysctl net.ipv6.conf.all.disable_ipv6=0 --mount type=bind,source=$CNG_PATH,destination=/home/user/contiki-ng -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/bus/usb:/dev/bus/usb -ti contiker/contiki-ng"
# cuda
# export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
# export LD_LIBRARY_PATH="/usr/local/cuda/include/:$LD_LIBRARY_PATH"
# export PATH="$PATH:/usr/local/cuda/bin"
export TF_CPP_MIN_LOG_LEVEL='3'

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
 [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
 [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox,.venv,.mypy_cache,.pytest_cache,.cache,.eggs,build,dist,node_modules,__pycache__,venv}'
source ~/.config/zfunc/lazy-nvm.sh

# Poetry
fpath+=~/.config/zfunc
autoload -Uz compinit && compinit
alias decolor="sed $'s/\e\\[[0-9;:]*[a-zA-Z]//g' | sed 's/\r//g' | sed 's/\^\[\[0;31m//g' | sed 's/\^\[\[0;31m//g' | sed 's/\^\[\[0m//g' | sed 's/\^M\\$//g'"
alias pp='poetry run python'
alias pt='poetry run pytest -vvx'
alias ptd='poetry run pytest --log-cli-level=DEBUG'

# Ruby Gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

alias gcg="git config --edit --global"
alias gcl="git config --edit --local"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="$PATH:$HOME/.tmux/plugins/tmuxifier/bin"
alias tm='tmuxifier'

# android
alias android="/opt/android-studio/bin/studio.sh"
export ANDROID_HOME=$HOME/Android/Sdk
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

alias bpytop='bpytop -lc'

# flutter
export PATH="$PATH:/usr/local/bin/flutter/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"

# -- START ACTIVESTATE INSTALLATION
export PATH="$HOME/.local/ActiveState/StateTool/release/bin:$PATH"
# -- STOP ACTIVESTATE INSTALLATION
# -- START ACTIVESTATE DEFAULT RUNTIME ENVIRONMENT
export PATH="$HOME/.cache/activestate/bin:$PATH"
if [[ ! -z "$ACTIVESTATE_ACTIVATED" && -f "$ACTIVESTATE_ACTIVATED/activestate.yaml" ]]; then
  echo "State Tool is operating on project $ACTIVESTATE_ACTIVATED_NAMESPACE, located at $ACTIVESTATE_ACTIVATED"
fi
# -- STOP ACTIVESTATE DEFAULT RUNTIME ENVIRONMENT

# enable undercurl
export KONSOLE_VERSION="230804"

# Rust
. "$HOME/.cargo/env"

# Vale
export VALE_CONFIG_PATH="$HOME/.config/vale/.vale.ini"
export VALE_STYLES_PATH="$HOME/.config/vale/styles"

# Misc
alias chrome="google-chrome"
alias get_size="du -sh $(ls -A) | sort -h | tac | head"
alias zshconfig="nvim ~/.zshrc"
alias zshsource="source ~/.zshrc"
alias lss="ls -lhtr"

# Github Copilot
alias ghc="gh copilot suggest"
