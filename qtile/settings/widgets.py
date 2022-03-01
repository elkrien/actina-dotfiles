# from libqtile import backend, widget
from qtile_extras import widget
from qtile_extras.widget.decorations import RectDecoration
from .theme import colors
from libqtile import qtile, backend
import subprocess
import os

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)

myTerm = "kitty"
home = os.path.expanduser('~')

def base(fg='text', bg='dark'): 
    return {
        'foreground': colors[fg],
        'background': colors[bg]
    }

def separator():
    return widget.Sep(**base(), linewidth=0, padding=7)

def workspaces(): 
    return [
        widget.GroupBox(
            **base(),
            font='Inter Nerd Font',
            fontsize=19,
            margin_y=4,
            margin_x=0,
            padding_y=5,
            padding_x=5,
            borderwidth=4,
            active=colors['active'],
            inactive=colors['inactive'],
            highlight_method="line",
            rounded=False,
            # block_highlight_text_color=colors['dark'],
            highlight_color=colors['dark'],
            this_current_screen_border=colors['focus'],
            this_screen_border=colors['grey'],
            other_current_screen_border=colors['dark'],
            other_screen_border=colors['dark'],
            urgent_alert_method='border',
            urgent_border=colors['dark'],
            disable_drag=True,
            center_aligned=True
        ),
    ]

primary_widgets = [
        
    widget.TextBox(
        **base(fg='cyan'),
        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn("rofi -no-config -no-lazy-grab -show drun -theme ~/.config/rofi/full-launcher.rasi")},
        fontsize=24,
        padding=10,
        text=''
    ),

    separator(),

    *workspaces(),
    
    # widget.GroupBox(
    #     **base(fg='light'),
    #     font='Inter Nerd Font',
    #     fontsize=19,
    #     borderwidth=4,
    #     active=colors['orange'],
    #     inactive=colors['inactive'],
    #     highlight_method="line",
    #     highlight_color=colors['dark'],
    #     this_current_screen_border=colors['orange'],
    #     disable_drag=True,
    #     center_aligned=True,
    #     visible_groups=[""]
    # ),

    separator(),

        # font='JetBrainsMonoMedium Nerd Font', 
    widget.WindowName(
        **base(fg='focus'),
        format=' {name}', 
        fontsize=14, 
        font='Open Sans semibold', 
        padding=5, 
        max_chars=50
    ),
    
    separator(),

    widget.Systray(
        background=colors['dark'],
        padding=5, 
        icon_size=19,
    ),
    
    separator(),

    widget.TextBox(
        **base(fg='dark'),
        fontsize=17,
        font='Inter Nerd Font',
        text=' ',
        mouse_callbacks = {
            'Button1': lambda: qtile.cmd_spawn("python3 " + home + "/.config/qtile/scripts/check_updates.py"),
            'Button3': lambda: qtile.cmd_spawn(myTerm + ' -e paru -Syu --skipreview')
        },
        padding=4,
        decorations=[
            RectDecoration(
                colour=colors['orange'],
                radius=0,
                filled=True,
                padding_y=6,
            )
        ]
    ),
    widget.GenPollText(
	    **base(),
        update_interval=1800,
		fmt='{}',
		font="Open Sans semibold",
        fontsize=16,
		mouse_callbacks = {
            'Button1': lambda: qtile.cmd_spawn("python3 " + home + "/.config/qtile/scripts/check_updates.py"),
            'Button3': lambda: qtile.cmd_spawn(myTerm + ' -e paru -Syu --skipreview')
        },
        func=lambda: subprocess.check_output(home + "/.config/qtile/scripts/updates_count.sh").decode("utf-8").replace('\n', ''),
        padding=10,
        decorations=[
            RectDecoration(
                colour=colors['dark_light'],
                radius=0,
                filled=True,
                padding_y=7,
                padding_x=0,
            ),
            RectDecoration(
                colour=colors['orange'],
                radius=0,
                filled=False,
                line_width=2,
                padding_y=7,
                padding_x=1,
            ),
        ]
	),


    # widget.CheckUpdates(
    #     **base(),
    #     colour_have_updates=colors['light'],
    #     colour_no_updates=colors['light'],
    #     fontsize=16,
    #     no_update_string=' 0',
    #     font='Open Sans semibold',
    #     # distro='Arch_checkupdates',
    #     display_format=' {updates}',
    #     update_interval=1800,
    #     custom_command="~/.config/qtile/scripts/updates_count.sh",
    #     mouse_callbacks = {
    #         'Button1': lambda: qtile.cmd_spawn("python3 " + home + "/.config/qtile/scripts/check_updates.py"),
    #         'Button3': lambda: qtile.cmd_spawn(myTerm + ' -e paru -Syu --skipreview')
    #     }
    # ),

    separator(),

    # widget.Battery(
    #     **base(fg='dark'),
    #     fontsize=19,
    #     font='Inter Nerd Font bold',
    #     battery='BAT1',
    #     charge_char='',
    #     discharge_char='',
    #     full_char='',
    #     empty_char='',
    #     unknown_char='',
    #     show_short_text=False,
    #     format=' {char}',    #{percent:2.0%}',
    #     low_foreground=colors['red'],
    #     low_percentage=0.1,
    #     notify_below=0.2,
    #     mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(home + "/.config/qtile/scripts/batt.sh")},
    #     padding=2,
    #     decorations=[
    #         RectDecoration(
    #             colour=colors['green'],
    #             radius=0,
    #             filled=True,
    #             padding_y=6,
    #         )
    #     ]
    # ),
    # widget.Battery(
    #     **base(),
    #     fontsize=16,
    #     font='Open Sans semibold',
    #     battery='BAT1',
    #     format='{percent:2.0%}',    #{percent:2.0%}',
    #     show_short_text=False,
    #     low_foreground=colors['red'],
    #     low_percentage=0.2,
    #     notify_below=0.1,
    #     mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(home + "/.config/qtile/scripts/batt.sh")},
    #     padding=8,
    #     decorations=[
    #         RectDecoration(
    #             colour=colors['dark_light'],
    #             radius=0,
    #             filled=True,
    #             padding_y=7,
    #             padding_x=0,
    #         ),
    #         RectDecoration(
    #             colour=colors['green'],
    #             radius=0,
    #             filled=False,
    #             line_width=2,
    #             padding_y=7,
    #             padding_x=1,
    #         ),
    #     ]
    # ),

    # separator(),

    # widget.TextBox(
    #     **base(fg='dark'),
    #     fontsize=18,
    #     font='Inter Nerd Font',
    #     text=' 盛',
    #     padding=2,
    #     decorations=[
    #         RectDecoration(
    #             colour=colors['yellow'],
    #             radius=0,
    #             filled=True,
    #             padding_y=6,
    #         )
    #     ]
    # ),
    # widget.Backlight(
    #     **base(),
    #     # backlight_name='intel_backlight',
    #     fmt='{}',
    #     font='Open Sans semibold',
    #     fontsize=16,
    #     padding=8,
    #     decorations=[
    #         RectDecoration(
    #             colour=colors['dark_light'],
    #             radius=0,
    #             filled=True,
    #             padding_y=7,
    #             padding_x=0,
    #         ),
    #         RectDecoration(
    #             colour=colors['yellow'],
    #             radius=0,
    #             filled=False,
    #             line_width=2,
    #             padding_y=7,
    #             padding_x=1,
    #         ),
    #     ]
    # ),

    # separator(),

    # widget.PulseVolume(
    #     **base(fg='cyan'),
    #     font='Symbola bold',
    #     fontsize=18,
    #     emoji=True
    # ),
    widget.TextBox(
        **base(fg='dark'),
        fontsize=18,
        font='Inter Nerd Font',
        text=' ',
        padding=2,
        decorations=[
            RectDecoration(
                colour=colors['blue'],
                radius=0,
                filled=True,
                padding_y=6,
            )
        ]
    ),
    widget.PulseVolume(
        **base(),
        font='Open Sans semibold',
        fontsize=16,
        padding=8,
        fmt='{}',
        mouse_callbacks = {'Button3': lambda: qtile.cmd_spawn("pavucontrol")},
        decorations=[
            RectDecoration(
                colour=colors['dark_light'],
                radius=0,
                filled=True,
                padding_y=7,
                padding_x=0,
            ),
            RectDecoration(
                colour=colors['blue'],
                radius=0,
                filled=False,
                line_width=2,
                padding_y=7,
                padding_x=1,
            ),
        ]
    ),
    
    separator(),

    widget.Wlan(
        **base(fg='dark'),
        format=' 直', 
        disconnected_message=' 睊',
        fontsize=18,
        font='Inter Nerd Font',
        interface='wlp5s0',
        update_interval=5,
        mouse_callbacks = {
            'Button1': lambda: qtile.cmd_spawn(home + "/.config/qtile/scripts/wifi.sh"),
            'Button3': lambda: qtile.cmd_spawn(myTerm + ' -e nmtui')
        },
        padding=2,
        decorations=[
            RectDecoration(
                colour=colors['green'],
                radius=0,
                filled=True,
                padding_y=6,
            )
        ]
    ),
    widget.Wlan(
        **base(),
        format='{percent:2.0%}',
        disconnected_message=' ',
        fontsize=16,
        font='Open Sans semibold',
        interface='wlp5s0',
        update_interval=5,
        mouse_callbacks = {
            'Button1': lambda: qtile.cmd_spawn(home + "/.config/qtile/scripts/wifi.sh"),
            'Button3': lambda: qtile.cmd_spawn(myTerm + ' -e nmtui')
        },
        padding=8,
        decorations=[
            RectDecoration(
                colour=colors['dark_light'],
                radius=0,
                filled=True,
                padding_y=7,
                padding_x=0,
            ),
            RectDecoration(
                colour=colors['green'],
                radius=0,
                filled=False,
                line_width=2,
                padding_y=7,
                padding_x=1,
            ),
        ]
    ),
    
    separator(),

    widget.TextBox(
        **base(fg='dark'),
        fontsize=18,
        font='Inter Nerd Font',
        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(home + "/.config/qtile/scripts/calendar.sh curr")},
        text=' ',
        padding=2,
        decorations=[
            RectDecoration(
                colour=colors['purple'],
                radius=0,
                filled=True,
                padding_y=6,
            )
        ]
    ),
    widget.Clock(
        **base(),
        format='%H:%M',
        font='Open Sans semibold',
        fontsize=16,
        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(home + "/.config/qtile/scripts/calendar.sh curr")},                    
        padding=8,
        decorations=[
            RectDecoration(
                colour=colors['dark_light'],
                radius=0,
                filled=True,
                padding_y=7,
                padding_x=0,
            ),
            RectDecoration(
                colour=colors['purple'],
                radius=0,
                filled=False,
                line_width=2,
                padding_y=7,
                padding_x=1,
            ),
        ]
    ),
    
    # separator(), 

    widget.TextBox(
        **base(fg='red'),
        fontsize=18,
        font='Inter Nerd Font',
        padding=10,
        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(home + "/.config/qtile/scripts/powermenu.sh")},
        text=''
    ),
]

secondary_widgets = [
    
    widget.TextBox(
        **base(fg='cyan'),
        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn("rofi -no-config -no-lazy-grab -show drun -theme ~/.config/rofi/full-launcher.rasi")},
        fontsize=24,
        padding=10,
        text=''
    ),
    
    separator(),

    *workspaces(),

    separator(),
    
    widget.WindowName(
        **base(fg='focus'),
        format=' {name}', 
        fontsize=14, 
        font='Open Sans semibold', 
        padding=5, 
        max_chars=50
    ),
    
    separator(),
    
    widget.TextBox(
        **base(fg='dark'),
        fontsize=18,
        font='Inter Nerd Font',
        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(home + "/.config/qtile/scripts/calendar.sh curr")},
        text=' ',
        padding=2,
        decorations=[
            RectDecoration(
                colour=colors['magenta'],
                radius=0,
                filled=True,
                padding_y=6,
            )
        ]
    ),
    
    widget.Clock(
        **base(),
        format='%H:%M',
        font='Open Sans semibold',
        fontsize=16,
        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(home + "/.config/qtile/scripts/calendar.sh curr")},                    
        padding=8,
        decorations=[
            RectDecoration(
                colour=colors['dark_light'],
                radius=0,
                filled=True,
                padding_y=7,
                padding_x=0,
            ),
            RectDecoration(
                colour=colors['magenta'],
                radius=0,
                filled=False,
                line_width=2,
                padding_y=7,
                padding_x=1,
            ),
        ]
    ),
    
    separator(), 
    
    # widget.CurrentLayoutIcon(foreground=colors['cyan'], scale=0.4),
    # widget.CurrentLayout(**base(), padding=5),
]

widget_defaults = {
    'font': 'Inter Nerd Font',
    'fontsize': 16,
    'padding': 1,
}

extension_defaults = widget_defaults.copy()
