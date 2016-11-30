# Simple plugin for Zsh for working with tmux

# Provides colour exporting and working SSH socket manipulation

[ -z "$TMUX" ] && export TERM=xterm-256color

if [ -n "$TMUX" ]; then
  TMUX_SESSION=`tmux display-message -p '#S'`
  SOCK="$HOME/.ssh/.ssh-agent-$USER-tmux-$TMUX_SESSION"
  if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]; then
    rm -f $SOCK
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
  fi
fi
