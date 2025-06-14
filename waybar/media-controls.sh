#!/usr/bin/env bash

player="brave"

# Temp cache file for title (to avoid flashing "No Media")
cache_file="/tmp/waybar_media_title"

# Default
media_title="No Media"

# Check if player is running
if playerctl -p "$player" status &>/dev/null; then
    status=$(playerctl -p "$player" status 2>/dev/null)
    title=$(playerctl -p "$player" metadata title 2>/dev/null)

    # Use cached title if title is empty (song switching case)
    if [[ -z "$title" && -f "$cache_file" ]]; then
        title=$(cat "$cache_file")
    elif [[ -n "$title" ]]; then
        echo "$title" > "$cache_file"
    fi

    # Set media title line with icons
    media_title="${title:-No Media}"
else
    # If player isn't running, clear cache and fallback
    rm -f "$cache_file"
    media_title="󰎆 No Media"
fi

# Escape quotes
escaped_title=$(echo "$media_title" | sed 's/"/\\"/g')

# Output JSON
echo "{\"text\": \"$escaped_title\"}"
