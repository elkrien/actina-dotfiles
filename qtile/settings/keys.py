# Qtile keybindings
from libqtile.config import EzKey as Key
from libqtile.lazy import lazy
import os

myTerm = "kitty"
home = os.path.expanduser('~')

keys = [

    # --- Applications shortcuts ---
    Key("M-<Return>", lazy.spawn(myTerm)),                                  # Open Terminal (Alacritty)
    Key("M-S-<Return>", lazy.group["scratchpad"].dropdown_toggle('term')),  # Dropdown Terminal (Scratchpad)
    Key("M-e", lazy.spawn("nemo")),			                            # Open File Explorer (Thunar)
    Key("M-S-e", lazy.group["scratchpad"].dropdown_toggle('ranger')),       # Open ranger in scratchpad
    Key("M-v", lazy.spawn("code")),			                                # Open Visual Code
    Key("M-w", lazy.spawn("microsoft-edge-stable")),                        # Open web browser (MS Edge)
    Key("M-m", lazy.spawn("mailspring")),	                                # Open mail (mailspring)
    Key("M-a", lazy.group["scratchpad"].dropdown_toggle('radio')),          # Open pyradio in scratchpad
    Key("M-S-a", lazy.group["scratchpad"].dropdown_toggle('spotify')),      # Open ncspot in scratchpad
    Key("M-s", lazy.spawn("flameshot gui")), 	                            # Screenshot Menu
    
    # --- Rofi menu ---
    Key("M-r", lazy.spawn("rofi -no-config -no-lazy-grab -show drun -theme ~/.config/rofi/small-launcher-alt.rasi")), 	# Appplications launcher (small)
    Key("M-S-r", lazy.spawn("rofi -no-config -no-lazy-grab -show drun -theme ~/.config/rofi/full-launcher.rasi")), 	# Applications launcher (full screen)
    Key("A-<Tab>", lazy.spawn("rofi -show window -theme ~/.config/rofi/windows-alt.rasi")), # Windows switcher
    Key("M-p", lazy.spawn(home + "/.config/qtile/scripts/powermenu.sh")),		    # PowerMenu
    Key("M-t", lazy.spawn(home + "/.config/qtile/scripts/keys.sh")),                # Show Keybindings
    
    # --- Change windows focus ---
    Key("M-j", lazy.layout.down()),	                # Switch window down
    Key("M-k", lazy.layout.up()),	                # Switch window up
    Key("M-h", lazy.layout.left()),	                # Switch window left
    Key("M-l", lazy.layout.right()),	            # Switch window right
    Key("M-<Down>", lazy.layout.down()),	        # Switch window down
    Key("M-<Up>", lazy.layout.up()),	            # Switch window up
    Key("M-<Left>", lazy.layout.left()),	        # Switch window left
    Key("M-<Right>", lazy.layout.right()),	        # Switch window right
    
    # --- Move window (shuffle) ---
    Key("M-S-j", lazy.layout.shuffle_down()),	    # Move (shuffle) window down
    Key("M-S-k", lazy.layout.shuffle_up()),	        # Move (shuffle) window up
    Key("M-S-h", lazy.layout.shuffle_left()),	    # Move (shuffle) window left
    Key("M-S-l", lazy.layout.shuffle_right()),	    # Move (shuffle) window right
    
    # --- Move window (flip) ---
    Key("M-A-j", lazy.layout.flip_down()),	        # Move (flip) window down
    Key("M-A-k", lazy.layout.flip_up()),	        # Move (flip) window up
    Key("M-A-h", lazy.layout.flip_left()),	        # Move (flip) window left
    Key("M-A-l", lazy.layout.flip_right()),	        # Move (flip) window right

    # --- Resize windows ---
    Key("M-C-h",                                    # Resize window left
        lazy.layout.shrink(),
        lazy.layout.grow_left(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
    ),
    Key("M-C-<Left>",                               # Resize window left
        lazy.layout.shrink(),
        lazy.layout.grow_left(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
    ), 
    Key("M-C-l",                                    # Resize window right
        lazy.layout.grow(),
        lazy.layout.grow_right(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
    ),
    Key("M-C-<Right>",                              # Resize window right
        lazy.layout.grow(),
        lazy.layout.grow_right(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
    ),
    Key("M-C-k",                                    # Resize window up
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
    ),
    Key("M-C-<Up>",                                 # Resize window up
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
    ),
    Key("M-C-j",                                    # Resize window down
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),
    Key("M-C-<Down>",                               # Resize window down
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
    ),

    # --- Layout change ---
    Key("M-<Tab>", lazy.next_layout()),		        # Toggle next layout
    Key("M-S-<Tab>", lazy.prev_layout()),	        # Toggle previous layout
    Key("M-S-f", lazy.window.toggle_floating()),    # Toggle floating

    # --- Other windows shortcuts ---
    Key("M-<Escape>", lazy.next_screen()),		    # Switch focus to next monitor
    Key("M-S-n", lazy.layout.normalize()),	        # Windows reset
    Key("M-<space>", lazy.layout.toggle_split()),	# Toggle split
    
    # --- System / Qtile ---
    Key("M-S-q", lazy.window.kill()),					        # Kill active window
    Key("M-C-r", lazy.restart()),					            # Restart Qtile
    Key("M-C-q", lazy.shutdown()),					            # Shutdown Qtile
    Key("M-S-C-q", lazy.spawn("shutdown 0")),		            # Shutdown computer
    Key("M-S-C-l", lazy.spawn("betterlockscreen -l blur")),		# Lock screen

    # --- Volume (hold shift for lighter adjustments) ---
    Key("<XF86AudioLowerVolume>", lazy.spawn(home + "/.config/qtile/scripts/volume.sh -5%")),		    # Volume down -5%
    Key("S-<XF86AudioLowerVolume>", lazy.spawn(home + "/.config/qtile/scripts/volume.sh -1%")),	        # Volume down -1%
    Key("<XF86AudioRaiseVolume>", lazy.spawn(home + "/.config/qtile/scripts/volume.sh +5%")),		    # Volume up +5%
    Key("S-<XF86AudioRaiseVolume>", lazy.spawn(home + "/.config/qtile/scripts/volume.sh +1%")),	        # Volume up +1%
    Key("<XF86AudioMute>", lazy.spawn(home + "/.config/qtile/scripts/volume.sh toggle")),		        # Toggle mute

    # --- Brightness (hold shift for lighter adjustments) ---
    Key("<XF86MonBrightnessUp>", lazy.spawn(home + "/.config/qtile/scripts/brightness.sh +5%")),	    # Brightness up +5%
    Key("S-<XF86MonBrightnessUp>", lazy.spawn(home + "/.config/qtile/scripts/brightness.sh +1%")),	    # Brightness up +1%
    Key("<XF86MonBrightnessDown>", lazy.spawn(home + "/.config/qtile/scripts/brightness.sh 5%-")),	    # Brightness down -5%
    Key("S-<XF86MonBrightnessDown>", lazy.spawn(home + "/.config/qtile/scripts/brightness.sh 1%-")),	# Brightness down -1%

]
