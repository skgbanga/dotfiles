#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# source the bashrc
source ~/.bashrc

# Customize to your needs...
export PATH="/Users/Sandeep/.local/bin/"
export PATH="$PATH:/Users/Sandeep/Documents/courses/python/anaconda3/bin/"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/sbin/"

export PATH="$PATH:/usr/lib64/qt-3.3/bin"
export PATH="$PATH:/usr/NX/bin"
export PATH="$PATH:/usr/kerberos/sbin"
export PATH="$PATH:/usr/kerberos/bin"

export PATH="$PATH:/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/var/cfengine/bin"
export PATH="$PATH:/apps/infra/java/groovy/bin"
export PATH="$PATH:/apps/infra/java/maven/bin"
export PATH="$PATH:/apps/infra/java/8/bin"
export PATH="$PATH:/apps/infra/bin"
export PATH="$PATH:/apps/infra/bin/opteron_rhel22"
export PATH="$PATH:/spare/local/sgupta/venv-infra/bin"

alias vims='vim -u /etc/vimrc'

setopt clobber
setopt no_share_history
