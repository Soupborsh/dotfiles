function dark_theme
    ln -sf /usr/share/color-schemes/BreezeDark.colors ~/.config/qt6ct/theme_link.colors
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
end
