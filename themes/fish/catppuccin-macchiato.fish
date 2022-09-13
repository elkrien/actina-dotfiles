# Catppuccin-Macchiato color palette

# --> special
set -l foreground C5CFF5
set -l selection 363A4F

# --> palette
set -l teal 8BD5CA
set -l flamingo F0C6C6
set -l magenta C6A0F6
set -l pink F5BDE6
set -l red ED8796
set -l peach F5A97F
set -l green A6DA95
set -l yellow EED49F
set -l blue 86AEF8
set -l gray 6C728D

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
