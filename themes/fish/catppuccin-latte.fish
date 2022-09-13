# Catppuccin-Latte color palette

# --> special
set -l foreground 4C4F69
set -l selection CCD0DA

# --> palette
set -l teal 179299
set -l flamingo DD7878
set -l magenta 8839EF
set -l pink EC83D0
set -l red D20F39
set -l peach FE640B
set -l green 40A02B
set -l yellow E49320
set -l blue 2A6EF5
set -l gray 9CA0B0

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
