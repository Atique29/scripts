#!/bin/bash

SEARCH_DIR="$HOME"

EXCLUDES=(
    -path "$HOME/.cache" -o
    -path "$HOME/STM32Cube" -o
    -path "$HOME/Arduino" -o
    -path "$HOME/.arduino15" -o
    -path "$HOME/.bin" -o
    -path "$HOME/EAGLE" -o
    -path "$HOME/.thunderbird" -o
    -path "$HOME/.matlab" -o
    -path "$HOME/.password-store" -o
    -path "$HOME/.stm32cubemx" -o
    -path "$HOME/.stmcufinder" -o
    -path "$HOME/.vim" -o
    -path "$HOME/.vnc" -o
    -path "$HOME/.eclipse" -o
    -path "$HOME/.java" -o
    -path "$HOME/.local"
)

CHOICE=$(find "$SEARCH_DIR" \( "${EXCLUDES[@]}" \) -prune -o -maxdepth 5 \( -type f -o -type d \) -print 2>/dev/null \
    | sed "s|$HOME|~|" \
    | dmenu -i -nb '#1d2021' -nf '#ebdbb2' -sb '#ebdbb2' -sf '#1d2021' -fn 'JetBrainsMono:pixelsize=16' -p " grab 🔥 " -l 15)

if [ -n "$CHOICE" ]; then
    CHOICE="${CHOICE/#\~/$HOME}"
    xdg-open "$CHOICE" >/dev/null 2>&1 &
fi

