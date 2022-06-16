import subprocess as sp
import os
from prettytable import PrettyTable

# Language (modify for translation):
PACKAGE = "Pakiet"
CURRENT_VERSION = "Zainstalowana wersja"
NEW_VERSION = "Nowa wersja"
WAIT_CHECKING = "Sprawdzanie aktualizacji..."
NO_UPDATES = "System aktualny"
AVAILABLE_UPDATES = "Dostępne aktualizacje: "

# Table definition and settings:
updates_table = PrettyTable(
    vertical_char="│",
    horizontal_char="─",
    bottom_right_junction_char="╯",
    bottom_left_junction_char="╰",
    top_left_junction_char="╭",
    top_right_junction_char="╮",
    left_junction_char="├",
    right_junction_char="┤",
    bottom_junction_char="┴",
    top_junction_char="┬",
    junction_char="┼",
)
updates_table.field_names = [PACKAGE, CURRENT_VERSION, NEW_VERSION]

# Show waiting popup first:
os.system(
    f'dunstify -t 1500 -i "/home/mm/.config/qtile/icons/updates.svg" " {WAIT_CHECKING} "'
)

# Check for updates by pacman and paru (Aur) and merge them together:
pacman_updates = sp.getoutput("checkupdates")
paru_updates = sp.getoutput("paru -Qua")
updates = pacman_updates + "\n" + paru_updates

# Show updates in dunst:
if pacman_updates == "" and paru_updates == "":
    os.system(
        f'dunstify -i "/home/mm/.config/qtile/icons/updates.svg" " {NO_UPDATES} "'
    )
else:
    # Create table with updates from the list:
    updates_list = [line.split() for line in updates.splitlines()]
    for item in updates_list:
        if item:
            item.pop(2)
            updates_table.add_row(item)
    # Show table in notification popup
    os.system(
        f'dunstify -i "/home/mm/.config/qtile/icons/updates.svg" "{AVAILABLE_UPDATES}" "{updates_table}"'
    )

