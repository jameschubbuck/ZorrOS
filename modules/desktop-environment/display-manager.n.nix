{
  # https://github.com/derflocki/multi-monitor-login
  # https://gitlab.gnome.org/GNOME/gnome-shell/-/issues/3867
  services.displayManager = {
    defaultSession = "hyprland";
    gdm = {
      enable = true;
    };
  };
}
