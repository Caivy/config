#!/bin/zsh

# Path to colors-kitty.conf
COLOR_FILE="$HOME/.cache/wal/colors-kitty.conf"

# Read colors from the file and export as environment variables
export TMUX_COLOR_FOREGROUND=$(grep '^foreground' $COLOR_FILE | cut -d ' ' -f 2)
export TMUX_COLOR_BACKGROUND=$(grep '^background' $COLOR_FILE | cut -d ' ' -f 2)
export TMUX_COLOR_COLOR0=$(grep '^color0' $COLOR_FILE | cut -d ' ' -f 2)
export TMUX_COLOR_COLOR1=$(grep '^color1' $COLOR_FILE | cut -d ' ' -f 2)
export TMUX_COLOR_COLOR2=$(grep '^color2' $COLOR_FILE | cut -d ' ' -f 2)
export TMUX_COLOR_COLOR3=$(grep '^color3' $COLOR_FILE | cut -d ' ' -f 2)
export TMUX_COLOR_COLOR4=$(grep '^color4' $COLOR_FILE | cut -d ' ' -f 2)
export TMUX_COLOR_COLOR5=$(grep '^color5' $COLOR_FILE | cut -d ' ' -f 2)
export TMUX_COLOR_COLOR6=$(grep '^color6' $COLOR_FILE | cut -d ' ' -f 2)
export TMUX_COLOR_COLOR7=$(grep '^color7' $COLOR_FILE | cut -d ' ' -f 2)
export TMUX_COLOR_COLOR8=$(grep '^color8' $COLOR_FILE | cut -d ' ' -f 2)
export TMUX_COLOR_COLOR9=$(grep '^color9' $COLOR_FILE | cut -d ' ' -f 2)
export TMUX_COLOR_COLOR10=$(grep '^color10' $COLOR_FILE | cut -d ' ' -f 2)
export TMUX_COLOR_COLOR11=$(grep '^color11' $COLOR_FILE | cut -d ' ' -f 2)
export TMUX_COLOR_COLOR12=$(grep '^color12' $COLOR_FILE | cut -d ' ' -f 2)
export TMUX_COLOR_COLOR13=$(grep '^color13' $COLOR_FILE | cut -d ' ' -f 2)
export TMUX_COLOR_COLOR14=$(grep '^color14' $COLOR_FILE | cut -d ' ' -f 2)
export TMUX_COLOR_COLOR15=$(grep '^color15' $COLOR_FILE | cut -d ' ' -f 2)
