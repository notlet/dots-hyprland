export const keybindList = [[
    {
        "icon": "pin_drop",
        "name": "Workspaces: navigation",
        "binds": [
            { "keys": ["\uf31a", "+", "#"], "action": "Go to workspace #" },
            { "keys": ["\uf31a", "+", "S"], "action": "Toggle special workspace" },
            { "keys": ["\uf31a", "+", "(Scroll ↑↓)"], "action": "Go to workspace -1/+1" },
            { "keys": ["Ctrl", "\uf31a", "+", "←"], "action": "Go to workspace on the left" },
            { "keys": ["Ctrl", "\uf31a", "+", "→"], "action": "Go to workspace on the right" },
            { "keys": ["\uf31a", "+", "PageUp"], "action": "Go to workspace on the left" },
            { "keys": ["\uf31a", "+", "PageDown"], "action": "Go to workspace on the right" }
        ],
        "appeartick": 1
    },
    {
        "icon": "overview_key",
        "name": "Workspaces: management",
        "binds": [
            { "keys": ["\uf31a", "Alt", "+", "#"], "action": "Move window to workspace #" },
            { "keys": ["\uf31a", "Alt", "+", "S"], "action": "Move window to special workspace" },
            { "keys": ["\uf31a", "Alt", "+", "PageUp"], "action": "Move window to workspace on the left" },
            { "keys": ["\uf31a", "Alt", "+", "PageDown"], "action": "Move window to workspace on the right" }
        ],
        "appeartick": 1
    },
    {
        "icon": "move_group",
        "name": "Windows",
        "binds": [
            { "keys": ["\uf31a", "+", "←↑→↓"], "action": "Focus window in direction" },
            { "keys": ["\uf31a", "Shift", "+", "←↑→↓"], "action": "Swap window in direction" },
            { "keys": ["\uf31a", "+", ";"], "action": "Split ratio -" },
            { "keys": ["\uf31a", "+", "'"], "action": "Split ratio +" },
            { "keys": ["\uf31a", "+", "Lmb"], "action": "Move window" },
            { "keys": ["\uf31a", "+", "Mmb"], "action": "Move window" },
            { "keys": ["\uf31a", "+", "Rmb"], "action": "Resize window" },
            { "keys": ["\uf31a", "+", "F"], "action": "Fullscreen" },
            { "keys": ["\uf31a", "Alt", "+", "F"], "action": "Fake fullscreen" }
        ],
        "appeartick": 1
    }
],
[
    {
        "icon": "widgets",
        "name": "Widgets (AGS)",
        "binds": [
            { "keys": ["\uf31a", "OR", "\uf31a", "+", "Tab"], "action": "Toggle overview/launcher" },
            { "keys": ["Ctrl", "\uf31a", "+", "R"], "action": "Restart AGS" },
            { "keys": ["\uf31a", "+", "/"], "action": "Toggle this cheatsheet" },
            { "keys": ["\uf31a", "+", "N"], "action": "Toggle system sidebar" },
            { "keys": ["\uf31a", "+", "B", "OR", "\uf31a", "+", "O"], "action": "Toggle utilities sidebar" },
            { "keys": ["\uf31a", "+", "K"], "action": "Toggle virtual keyboard" },
            { "keys": ["Ctrl", "Alt", "+", "Del"], "action": "Power/Session menu" },

            { "keys": ["Esc"], "action": "Exit a window" },
            { "keys": ["rightCtrl"], "action": "Dismiss/close sidebar" },

            { "keys": ["Ctrl", "\uf31a", "+", "T"], "action": "Change wallpaper+colorscheme" },

            // { "keys": ["\uf31a", "+", "B"], "action": "Toggle left sidebar" },
            // { "keys": ["\uf31a", "+", "N"], "action": "Toggle right sidebar" },
            // { "keys": ["\uf31a", "+", "G"], "action": "Toggle volume mixer" },
            // { "keys": ["\uf31a", "+", "M"], "action": "Toggle useless audio visualizer" },
            // { "keys": ["(right)Ctrl"], "action": "Dismiss notification & close menus" }
        ],
        "appeartick": 2
    },
    {
        "icon": "construction",
        "name": "Utilities",
        "binds": [
            { "keys": ["PrtSc"], "action": "Screenshot  >>  clipboard" },
            { "keys": ["\uf31a", "Shift", "+", "S"], "action": "Screen snip  >>  clipboard" },
            { "keys": ["\uf31a", "Shift", "+", "T"], "action": "Image to text  >>  clipboard" },
            { "keys": ["\uf31a", "Shift", "+", "C"], "action": "Color picker" },
            { "keys": ["\uf31a", "Alt", "+", "R"], "action": "Record region" },
            { "keys": ["Ctrl", "Alt", "+", "R"], "action": "Record region with sound" },
            { "keys": ["\uf31a", "Shift", "Alt", "+", "R"], "action": "Record screen with sound" }
        ],
        "appeartick": 2
    },
    // {
    //     "icon": "edit",
    //     "name": "Edit mode",
    //     "binds": [
    //         { "keys": ["Esc"], "action": "Exit Edit mode" },
    //         { "keys": ["#"], "action": "Go to to workspace #" },
    //         { "keys": ["Alt", "+", "#"], "action": "Dump windows to workspace #" },
    //         { "keys": ["Shift", "+", "#"], "action": "Swap windows with workspace #" },
    //         { "keys": ["Lmb"], "action": "Move window" },
    //         { "keys": ["Mmb"], "action": "Move window" },
    //         { "keys": ["Rmb"], "action": "Resize window" }
    //     ],
    //     "appeartick": 2
    // }
],
[
    {
        "icon": "apps",
        "name": "Apps",
        "binds": [
            { "keys": ["\uf31a", "+", "T"], "action": "Launch terminal (kitty)" },
            { "keys": ["\uf31a", "+", "W"], "action": "Launch browser (Firefox)" },
            { "keys": ["\uf31a", "+", "C"], "action": "Launch editor (VSCodium)" },
            { "keys": ["\uf31a", "+", "P"], "action": "Launch process monitor (btop++)" },
            { "keys": ["\uf31a", "+", "E"], "action": "Launch file explorer (Nautilus)" },
            { "keys": ["\uf31a", "+", "I"], "action": "Launch settings (GNOME Control center)" }
        ],
        "appeartick": 3
    },
    {
        "icon": "keyboard",
        "name": "Typing",
        "binds": [
            { "keys": ["\uf31a", "+", "V"], "action": "Clipboard history  >>  clipboard" },
            { "keys": ["\uf31a", "+", "."], "action": "Emoji picker  >>  clipboard" },
        ],
        "appeartick": 3
    },
    {
        "icon": "terminal",
        "name": "Launcher actions",
        "binds": [
            { "keys": [">raw"], "action": "Toggle mouse acceleration" },
            { "keys": [">img"], "action": "Select wallpaper and generate colorscheme" },
            { "keys": [">light"], "action": "Switch to light theme" },
            { "keys": [">dark"], "action": "Switch to dark theme" },
            { "keys": [">badapple"], "action": "Apply black n' white colorscheme" },
            { "keys": [">color"], "action": "Pick acccent color" },
            { "keys": [">todo"], "action": "Type something after that to add a To-do item" },
        ],
        "appeartick": 3
    }
]];
