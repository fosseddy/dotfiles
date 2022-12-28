from typing import List  # noqa: F401

import re
import os

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = "alacritty"
browser = "brave"

keys = [
    Key([mod], "Return", lazy.spawn(terminal)),
    Key([mod], "b", lazy.spawn(browser)),

    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioMicMute", lazy.spawn("amixer set Capture toggle -q")),
    Key([], "XF86AudioRaiseVolume",
        lazy.spawn("amixer sset Master 5+ unmute -q")),

    Key([], "XF86AudioLowerVolume",
        lazy.spawn("amixer sset Master 5- unmute -q")),

    Key([], "XF86MonBrightnessUp", lazy.spawn("backlight-control inc")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("backlight-control dec")),

    Key([mod], "r", lazy.spawncmd()),

    # Switch between windows
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "space", lazy.layout.next()),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left()),
    Key([mod, "control"], "l", lazy.layout.grow_right()),
    Key([mod, "control"], "j", lazy.layout.grow_down()),
    Key([mod, "control"], "k", lazy.layout.grow_up()),
    Key([mod], "n", lazy.layout.normalize()),

    # Toggle between different layouts
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod, "shift"], "Tab", lazy.prev_layout()),

    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),

    Key([mod], "w", lazy.window.kill()),
    Key([mod], "f", lazy.window.toggle_floating()),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),

    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),

    Click([mod], "Button2", lazy.window.bring_to_front())
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
        # switch to group i
        Key([mod], i.name, lazy.group[i.name].toscreen()),

        # switch to & move focused window to group i
        Key([mod, "shift"], i.name,
            lazy.window.togroup(i.name, switch_group=True)),
    ])

theme = dict(
    margin=5,
    border_focus="#7fa5bd",
    border_normal="#000000",
    border_width=2,
)

layouts = [
    layout.Columns(**theme),
    layout.Max(margin=5)
]

widget_defaults = dict(
    font="CodeNewRoman",
    fontsize=14,
    padding=4
)

extension_defaults = widget_defaults.copy()

floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
    **theme
)

def parse_winname(text):
    m = re.search(r"\w+$", text)
    if not m:
        return "No Match"
    return m.group(0)

screens = [
    Screen(
        wallpaper=os.path.expanduser("~/wallpapers/tree.jpg"),
        wallpaper_mode="stretch",
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(scale=0.6),
                widget.GroupBox(this_current_screen_border="#7fa5bd"),
                widget.Prompt(prompt="run: "),

                widget.Spacer(),

                widget.Clock(format="%a %d %b %H:%M"),

                widget.Spacer(),

                widget.TextBox(text="CPU:"),
                widget.CPU(format="{load_percent}%"),
                widget.Sep(padding=theme["margin"]),

                widget.TextBox(text="RAM:"),
                widget.Memory(format="{MemUsed:.0f}{mm}"),
                widget.Sep(padding=theme["margin"]),

                widget.TextBox(text="Disk:"),
                widget.DF(visible_on_warn=False, format="{uf}{m}"),
                widget.Sep(padding=theme["margin"]),

                widget.TextBox(text="Volume:"),
                widget.Volume(),
                widget.Sep(padding=theme["margin"]),

                widget.TextBox(text="Wi-Fi:"),
                widget.Wlan(interface="wlp1s0", format="{essid}"),

                widget.Spacer(length=theme["margin"]),
            ],
            32,
            **{"background": "#000000"}
        ),
        bottom=bar.Bar(
            [
                widget.TaskList(
                    icon_size=0,
                    border="#7fa5bd",
                    txt_floating="f ",
                    txt_minimized="m ",
                    parse_text=parse_winname
                ),
            ],
            32,
            **{"background": "#000000"}
        ),
    ),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
