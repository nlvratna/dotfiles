fish_vi_key_bindings

set -g fish_cursor_default block
set -g fish_cursor_insert block
set -g fish_cursor_replace_one block
set -g fish_cursor_visual block

bind -M insert \cg 'tmux-sessionizer; commandline -f repaint'
bind -M default \cg 'tmux-sessionizer; commandline -f repaint'
