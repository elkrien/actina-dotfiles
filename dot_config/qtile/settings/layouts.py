from libqtile import layout
from libqtile.config import Match
from .theme import colors

layout_conf = {
    'border_focus': colors['focus'][0],
    'border_normal': colors['grey'][0],
    'border_width': 3,
    'margin': 9
}

layouts = [
    layout.MonadTall(**layout_conf),
    layout.MonadWide(**layout_conf),
    layout.Bsp(**layout_conf),
    layout.Max(**layout_conf),
    # layout.Matrix(columns=2, **layout_conf),
    # layout.RatioTile(**layout_conf),
    # layout.Columns(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

floating_layout = layout.Floating(
    float_rules = [
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class='confirmreset'),
        Match(wm_class='makebranch'),
        Match(wm_class='maketag'),
        Match(wm_class='pinentry-gtk-2'),
        Match(wm_class='Pinentry-gtk-2'),
        Match(wm_class='pavucontrol'),
        Match(wm_class='ssh-askpass'),
        Match(wm_class="feh"),
        Match(wm_class="dialog"),
        Match(title='branchdialog'),
        Match(title='Celluloid'),
        Match(title='mpv'),
        Match(title='pinentry'),
    ],
    **layout_conf
)
