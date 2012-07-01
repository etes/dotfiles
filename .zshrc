# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Look in ~/.oh-my-zsh/themes/
ZSH_THEME="feross"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh


# Load aliases
if [ -f "$HOME/.zshrc_aliases" ] ; then
    . $HOME/.zshrc_aliases
fi

# Set PATH, depending on where we are
if [[ -f "/etc/hostname" && `cat /etc/hostname` = "future" ]] ; then
    export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
fi
if [[ -f "/etc/hostname" && `cat /etc/hostname` = "box" ]] ; then
    export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
fi
if [[ -f "/etc/hostname" && `cat /etc/hostname` = "fatty" ]] ; then
    export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/Dropbox/bin" ] ; then
    PATH="$HOME/Dropbox/bin:$PATH"
fi

# Set Sublime Text 2 as default editor, fallback to vim
if [ -f "$HOME/bin/subl" ] ; then
    export EDITOR='subl -w'
else
    export EDITOR='vim'
fi

# Prevent stupid zsh suggestions. Only correct commands, not arguments
unsetopt correctall
setopt correct

# Python virtualenv should prefer "distribute" to "setuptools"
export VIRTUALENV_USE_DISTRIBUTE=true

