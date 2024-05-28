#!/bin/zsh

# Path to the colors file
COLORS_FILE=~/.cache/wal/colors

# Path to the output file
OUTPUT_FILE=~/.config/zellij/themes/pywal.kdl

# Extract colors from the colors file
FG=$(sed -n '1p' "$COLORS_FILE")
BG=$(sed -n '2p' "$COLORS_FILE")
BLACK=$(sed -n '3p' "$COLORS_FILE")
RED=$(sed -n '4p' "$COLORS_FILE")
GREEN=$(sed -n '5p' "$COLORS_FILE")
YELLOW=$(sed -n '6p' "$COLORS_FILE")
BLUE=$(sed -n '7p' "$COLORS_FILE")
MAGENTA=$(sed -n '8p' "$COLORS_FILE")
CYAN=$(sed -n '9p' "$COLORS_FILE")
WHITE=$(sed -n '10p' "$COLORS_FILE")
ORANGE=$(sed -n '11p' "$COLORS_FILE")

# Write to the output file
cat > "$OUTPUT_FILE" <<EOF
themes {
    pywal {
        fg "$FG"
        bg "$BG"
        black "$BLACK"
        red "$RED"
        green "$GREEN"
        yellow "$YELLOW"
        blue "$BLUE"
        magenta "$MAGENTA"
        cyan "$CYAN"
        white "$WHITE"
        orange "$ORANGE"
    }
}
EOF

echo "pywal.kdl has been created at $OUTPUT_FILE"
