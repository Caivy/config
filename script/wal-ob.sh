#!/bin/bash

# Set variable "workdir" to the path where this script is located
workdir="$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")"

manifest () {
  echo "{" > "$theme_dir/manifest.json"
  echo '    "name": "pywal-obsidianmd",' >> "$theme_dir/manifest.json"
  echo '    "version": "1.0.0",' >> "$theme_dir/manifest.json"
  echo '    "minAppVersion": "0.16.0",' >> "$theme_dir/manifest.json"
  echo '    "author": "zpay"' >> "$theme_dir/manifest.json"
  echo "}" >> "$theme_dir/manifest.json"
}

theme () {
  echo ".theme-dark {" > "$theme_dir/theme.css"
  echo "  --background-primary: $(head -n 1 ~/.cache/wal/colors);" >> "$theme_dir/theme.css"
  echo "  --background-primary-alt: $(head -n 4 ~/.cache/wal/colors | tail -1);" >> "$theme_dir/theme.css"
  echo "  --background-accent: $(head -n 2 ~/.cache/wal/colors | tail -1);" >> "$theme_dir/theme.css"
  echo "  --background-secondary: $(head -n 1 ~/.cache/wal/colors);" >> "$theme_dir/theme.css"
  echo "  --background-secondary-alt: $(head -n 4 ~/.cache/wal/colors | tail -1);" >> "$theme_dir/theme.css"
  echo "  --text-accent: $(head -n 3 ~/.cache/wal/colors | tail -1);" >> "$theme_dir/theme.css"
  echo "  --text-accent-hover: $(head -n 2 ~/.cache/wal/colors | tail -1);" >> "$theme_dir/theme.css"
  echo "  --background-modifier-border: $(head -n 4 ~/.cache/wal/colors | tail -1);" >> "$theme_dir/theme.css"
  echo "  --text-highlight-bg: $(head -n 4 ~/.cache/wal/colors | tail -1);" >> "$theme_dir/theme.css"
  echo "  --text-selection: $(head -n 14 ~/.cache/wal/colors | tail -1);" >> "$theme_dir/theme.css"
  echo "  --red: $(head -n 16 ~/.cache/wal/colors | tail -1);" >> "$theme_dir/theme.css"
  echo "  --green: $(head -n 15 ~/.cache/wal/colors | tail -1);" >> "$theme_dir/theme.css"
  echo "  --blue: $(head -n 14 ~/.cache/wal/colors | tail -1);" >> "$theme_dir/theme.css"
  echo "  --purple: $(head -n 13 ~/.cache/wal/colors | tail -1);" >> "$theme_dir/theme.css"
  echo "  --aqua: $(head -n 12 ~/.cache/wal/colors | tail -1);" >> "$theme_dir/theme.css"
  echo "  --yellow: $(head -n 11 ~/.cache/wal/colors | tail -1);" >> "$theme_dir/theme.css"
  echo "  --orange: $(head -n 10 ~/.cache/wal/colors | tail -1);" >> "$theme_dir/theme.css"
  echo "}" >> "$theme_dir/theme.css"
  # cat "$workdir/theme.css" >> "$theme_dir/theme.css"
}

make () {
  rm -rf "$theme_dir"
  mkdir -p "$theme_dir"
  touch "$theme_dir/manifest.json"
  touch "$theme_dir/theme.css"
}

# Use the directory where the script is located as the vault directory
vault_dir="$HOME/Documents/personal/Obsidian/Second-Brain/"

theme_dir="$vault_dir/.obsidian/themes/pywal-obsidianmd"

# Check if the colors file exists
if [[ ! -f ~/.cache/wal/colors ]]; then
  echo "Colors file does not exist: ~/.cache/wal/colors"
  exit 1
fi

make
manifest
theme

echo "Theme created successfully in $theme_dir"
