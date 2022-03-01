# Qtile workspaces
from libqtile.config import Group, EzKey as Key, ScratchPad, DropDown
from libqtile.lazy import lazy
from .keys import keys, myTerm
# from libqtile import hook

groups = (      #            
    Group('', layout='monadtall'),
    Group('', layout='monadtall'),
    Group('', layout='monadtall'),
    Group('', layout='monadtall'),
    Group('', layout='monadtall'),
    Group('', layout='monadtall'),
    ScratchPad('scratchpad', [
        DropDown(
            'term', myTerm, width=0.7, height=0.7,
            x=0.15, y=0.15, opacity=1.0, on_focus_lost_hide=False
        ),
        DropDown(
            'ranger', myTerm + ' ranger', width=0.7, height=0.7,
            x=0.15, y=0.15, opacity=1.0, on_focus_lost_hide=False
        ),
        DropDown(
            'radio', myTerm + ' pyradio', width=0.7, height=0.7,
            x=0.15, y=0.15, opacity=1.0, on_focus_lost_hide=False
        ),
        DropDown(
            'spotify', myTerm + ' ncspot', width=0.7, height=0.7,
            x=0.15, y=0.15, opacity=1.0, on_focus_lost_hide=False  
        ), ]
    ),
)

for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([
        # Switch to workspace N
        Key(f"M-{actual_key}", lazy.group[group.name].toscreen(toggle=True)),

        # Send window to workspace N
        # Key(f"M-S-{actual_key}", lazy.window.togroup(group.name)),

        # Send window to workspace N and follow moved window to workspace
        Key(f"M-S-{actual_key}", lazy.window.togroup(group.name) , lazy.group[group.name].toscreen(toggle=True)),
    ])

# Open application in specified group / workspace: 
# @hook.subscribe.client_new
# def client_new(client):
#     wm_class = client.window.get_wm_class()[0]
#     if wm_class == 'code':
#         client.togroup('')
#         client.group.cmd_toscreen(toggle=False)
#     if wm_class == 'Thunar':
#         client.togroup('')
#         client.group.cmd_toscreen(toggle=False)
#     if wm_class == 'microsoft-edge':
#         client.togroup('')
#         client.group.cmd_toscreen(toggle=False)
#     if wm_class == 'libreoffice' or wm_class == 'libreoffice-writer' or wm_class == 'libreoffice-calc':
#         client.togroup('')
#         client.group.cmd_toscreen(toggle=False)

