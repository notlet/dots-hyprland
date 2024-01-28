#!/usr/bin/env bash

sleep 0 # idk i want some delay or colors dont get applied properly
cd "$HOME/.config/ags" || exit

colornames=''
colorstrings=''
colorlist=()
colorvalues=()

if [[ "$1" = "--bad-apple" ]]; then
    cp scripts/color_generation/specials/_material_badapple.scss scss/_material.scss
    colornames=$(cat scripts/color_generation/specials/_material_badapple.scss | cut -d: -f1)
    colorstrings=$(cat scripts/color_generation/specials/_material_badapple.scss | cut -d: -f2 | cut -d ' ' -f2 | cut -d ";" -f1)
    IFS=$'\n'
    # filearr=( $filelist ) # Get colors
    colorlist=( $colornames ) # Array of color names
    colorvalues=( $colorstrings ) # Array of color values
else
    colornames=$(cat scss/_material.scss | cut -d: -f1)
    colorstrings=$(cat scss/_material.scss | cut -d: -f2 | cut -d ' ' -f2 | cut -d ";" -f1)
    IFS=$'\n'
    # filearr=( $filelist ) # Get colors
    colorlist=( $colornames ) # Array of color names
    colorvalues=( $colorstrings ) # Array of color values
fi

transparentize() {
  local hex="$1"
  local alpha="$2"
  local red green blue

  red=$((16#${hex:1:2}))
  green=$((16#${hex:3:2}))
  blue=$((16#${hex:5:2}))

  printf 'rgba(%d, %d, %d, %.2f)\n' "$red" "$green" "$blue" "$alpha"
}

get_light_dark() {
    lightdark=""
    if [ ! -f ~/.cache/ags/user/colormode.txt ]; then
        echo "" > ~/.cache/ags/user/colormode.txt
    else 
        lightdark=$(cat ~/.cache/ags/user/colormode.txt) # either "" or "-l"
    fi
    echo "$lightdark"
}

apply_gtklock() {
    # Check if scripts/templates/gtklock/main.scss exists
    if [ ! -f "scripts/templates/gtklock/main.scss" ]; then
        echo "SCSS not found. Fallback to CSS."
    else
        sassc ~/.config/ags/scripts/templates/gtklock/main.scss ~/.config/gtklock/style.css
        return
    fi
    
    # Check if scripts/templates/gtklock/style.css exists
    if [ ! -f "scripts/templates/gtklock/style.css" ]; then
        echo "Template file not found for Gtklock. Skipping that."
        return
    fi
    # Copy template
    cp "scripts/templates/gtklock/style.css" "$HOME/.config/gtklock/style.css"
    # Apply colors
    for i in "${!colorlist[@]}"; do
        sed -i "s/${colorlist[$i]};/${colorvalues[$i]};/g" "$HOME/.config/gtklock/style.css"
    done
}

apply_fuzzel() {
    # Check if scripts/templates/fuzzel/fuzzel.ini exists
    if [ ! -f "scripts/templates/fuzzel/fuzzel.ini" ]; then
        echo "Template file not found for Fuzzel. Skipping that."
        return
    fi
    # Copy template
    cp "scripts/templates/fuzzel/fuzzel.ini" "$HOME/.config/fuzzel/fuzzel.ini"
    # Apply colors
    for i in "${!colorlist[@]}"; do
        sed -i "s/{{ ${colorlist[$i]} }}/${colorvalues[$i]#\#}/g" "$HOME/.config/fuzzel/fuzzel.ini"
    done
}

apply_kitty() {
    if [ ! -f "scripts/templates/kitty/kitty.conf" ]; then
        echo "Template file not found for Kitty. Skipping that."
        return
    fi
    # Copy template
    cp "scripts/templates/kitty/kitty.conf" "$HOME/.config/kitty/kitty_new.conf"
    # Apply colors
    for i in "${!colorlist[@]}"; do
        sed -i "s/${colorlist[$i]} #/#${colorvalues[$i]#\#}/g" "$HOME/.config/kitty/kitty_new.conf"
    done

    cp "$HOME/.config/kitty/kitty_new.conf" "$HOME/.config/kitty/kitty.conf"
}

apply_vis() {
    if [ ! -f "scripts/templates/vis/material" ]; then
        echo "Template file not found for cli-visualizer colors. Skipping that."
        return
    fi
    # Copy template
    cp "scripts/templates/vis/material" "$HOME/.config/vis/colors/material_new"
    # Apply colors
    for i in "${!colorlist[@]}"; do
        sed -i "s/{{ ${colorlist[$i]} }}/${colorvalues[$i]#\#}/g" "$HOME/.config/vis/colors/material_new"
    done
    
    cp "$HOME/.config/vis/colors/material_new" "$HOME/.config/vis/colors/material"
}

apply_cava() {
    if [ ! -f "scripts/templates/cava/config" ]; then
        echo "Template file not found for cava colors. Skipping that."
        return
    fi
    # Copy template
    cp "scripts/templates/cava/config" "$HOME/.config/cava/config_new"
    # Apply colors
    for i in "${!colorlist[@]}"; do
        sed -i "s/{{ ${colorlist[$i]} }}/${colorvalues[$i]#\#}/g" "$HOME/.config/cava/config_new"
    done
    
    cp "$HOME/.config/cava/config_new" "$HOME/.config/cava/config"
}

apply_hyprland() {
    # Check if scripts/templates/hypr/colors.conf exists
    if [ ! -f "scripts/templates/hypr/colors.conf" ]; then
        echo "Template file not found for Hyprland colors. Skipping that."
        return
    fi
    # Copy template
    cp "scripts/templates/hypr/colors.conf" "$HOME/.config/hypr/colors_new.conf"
    # Apply colors
    for i in "${!colorlist[@]}"; do
        sed -i "s/{{ ${colorlist[$i]} }}/${colorvalues[$i]#\#}/g" "$HOME/.config/hypr/colors_new.conf"
    done
    
    mv "$HOME/.config/hypr/colors_new.conf" "$HOME/.config/hypr/colors.conf"
}

apply_gtk() { # Using gradience-cli
    lightdark=$(get_light_dark)
    
    # Copy template 
    cp "scripts/templates/gradience/preset_template.json" "scripts/templates/gradience/preset.json"

    # Apply colors
    for i in "${!colorlist[@]}"; do
        sed -i "s/{{ ${colorlist[$i]} }}/${colorvalues[$i]}/g" "scripts/templates/gradience/preset.json"
    done

    mkdir -p "$HOME/.config/presets" # create gradience presets folder
    gradience-cli apply -p scripts/templates/gradience/preset.json --gtk both

    # Set light/dark preference 
    # And set GTK theme manually as Gradience defaults to light adw-gtk3 
    # (which is unreadable when broken when you use dark mode)
    if [ "$lightdark" = "-l" ]; then
        gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
    else
        gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3-dark
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    fi
}

apply_ags() {
    sassc "$HOME"/.config/ags/scss/main.scss "$HOME"/.config/ags/style.css
    ags run-js 'openColorScheme.value = true; Utils.timeout(2000, () => openColorScheme.value = false);'
    ags run-js "App.resetCss(); App.applyCss('${HOME}/.config/ags/style.css');"
}

# apply_svgs
apply_ags &
apply_hyprland &
apply_gtk &
apply_gtklock &
apply_fuzzel &
apply_vis &
apply_cava &
apply_kitty &
apply_foot
