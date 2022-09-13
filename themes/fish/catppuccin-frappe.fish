# Catppuccin-Frappe color palette

# --> special
set -l foreground C6CEEF
set -l selection 414559

# --> palette
set -l teal 81C8BE
set -l flamingo EEBEBE
set -l magenta CA9EE6
set -l pink F4B8E4
set -l red E78284
set -l peach EF9F76
set -l green A6D189
set -l yellow E5C890
set -l blue 8CAAEE
set -l gray 737891

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
