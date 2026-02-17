{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    baobab
    nautilus
    gnome-disk-utility
    eog
    libnotify
    adwaita-icon-theme
  ];
  services.gvfs.enable = true;
  services.gnome.gnome-keyring.enable = true;
  programs.dconf.enable = true;
  systemd.tmpfiles.rules = [
    "A+ /var/lib/bluetooth - - - - u:james:rx"
  ];
}
