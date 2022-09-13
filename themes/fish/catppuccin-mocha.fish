# Catppuccin-Mocha color palette

# --> special
set -l foreground C6D0F5
set -l selection 313244

# --> palette
set -l teal 94E2D5
set -l flamingo F2CDCD
set -l magenta CBA6F7
set -l pink F5C2E7
set -l red F38BA8
set -l peach FAB387
set -l green A6E3A1
set -l yellow F9E2AF
set -l blue 90C1FB
set -l gray 696D86

# Syntax Highlighting
set -g fish_color_normal $foreground
set -g fish_color_command $blue
set -g fish_color_param $flamingo
set -g fish_color_keyword $red
set -g fish_color_quote $green
set -g fish_color_redirection $pink
set -g fish_color_end $peach
set -g fish_color_error $red
set -g fish_color_gray $gray
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $pink
set -g fish_color_escape $flamingo
set -g fish_color_autosuggestion $gray
set -g fish_color_cancel $red

# Prompt
set -g fish_color_cwd $yellow
set -g fish_color_user $teal
set -g fish_color_host $blue

# Completion Pager
set -g fish_pager_color_progress $gray
set -g fish_pager_color_prefix $pink
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $gray
