#!/bin/zsh

# Path to colors-kitty.conf
COLOR_FILE="$HOME/.cache/wal/colors-kitty.conf"

# Function to get color value from the file
get_color() {
    grep "^$1" "$COLOR_FILE" | awk '{print $2}'
}

# Read colors from the file and export as environment variables
export TMUX_COLOR_FOREGROUND=$(get_color 'foreground')
export TMUX_COLOR_BACKGROUND=$(get_color 'background')
export TMUX_COLOR_COLOR0=$(get_color 'color0')
export TMUX_COLOR_COLOR1=$(get_color 'color1')
export TMUX_COLOR_COLOR2=$(get_color 'color2')
export TMUX_COLOR_COLOR3=$(get_color 'color3')
export TMUX_COLOR_COLOR4=$(get_color 'color4')
export TMUX_COLOR_COLOR5=$(get_color 'color5')
export TMUX_COLOR_COLOR6=$(get_color 'color6')
export TMUX_COLOR_COLOR7=$(get_color 'color7')
export TMUX_COLOR_COLOR8=$(get_color 'color8')
export TMUX_COLOR_COLOR9=$(get_color 'color9')
export TMUX_COLOR_COLOR10=$(get_color 'color10')
export TMUX_COLOR_COLOR11=$(get_color 'color11')
export TMUX_COLOR_COLOR12=$(get_color 'color12')
export TMUX_COLOR_COLOR13=$(get_color 'color13')
export TMUX_COLOR_COLOR14=$(get_color 'color14')
export TMUX_COLOR_COLOR15=$(get_color 'color15')
