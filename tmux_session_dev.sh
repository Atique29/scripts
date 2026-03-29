#!/bin/bash

if [ -z $1 ]; then
    SESSION="code"
else
    SESSION=$1
fi

tmux has-session -t $SESSION 2>/dev/null

if [ $? != 0 ]; then
  tmux new-session -d -s $SESSION -n 'nvim'
  tmux new-window -t $SESSION:2 -n 'build'
  tmux new-window -t $SESSION:3 -n 'system'
  tmux new-window -t $SESSION:4 -n 'scratch'
  cd ~
  tmux select-window -t $SESSION:1
fi

tmux attach-session -t $SESSION
