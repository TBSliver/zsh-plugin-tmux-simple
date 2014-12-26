# Simple plugin for Zsh for working with tmux

# Provides colour exporting and working SSH socket manipulation

[ -z "$TMUX" ] && export TERM=xterm-256color

SOCK="$HOME/.ssh/.ssh-agent-$USER-tmux"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
  rm -f $SOCK
  ln -sf $SSH_AUTH_SOCK $SOCK
  export SSH_AUTH_SOCK=$SOCK
fi
