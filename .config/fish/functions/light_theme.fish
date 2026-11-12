function light_theme
    ln -sf /usr/share/color-schemes/BreezeLight.colors ~/.config/qt6ct/theme_link.colors
    gsettings set org.gnome.desktop.interface color-scheme prefer-light
    gsettings set org.gnome.desktop.interface icon-theme breeze
end
