{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    baobab # Disk usage analyzer
    pavucontrol # Audio control
    thunderbird # Email client
    keepassxc # Password manager
    nautilus # File manager
    gnome-disk-utility # Disk manager
    eog # Image viewer
    qbittorrent #
    unar # Archive manager
    gimp # Image editor
    (bottles.override {removeWarningPopup = true;}) # Wine prefix manager
    mangohud # System info viewer
    libnotify # Send notifications
    inkscape # Vector editor
    bc # Basic calculator
    adwaita-icon-theme # Icons
    mpv # Media player
    ffmpeg
    librepods
    android-tools
    blender
    super-slicer
  ];
  programs.steam.enable = true;
  nixpkgs.config.allowUnfree = true;
  services.gvfs.enable = true;
  systemd.tmpfiles.rules = [
    "A+ /var/lib/bluetooth - - - - u:james:rx"
  ];
  services.mullvad-vpn.enable = true;
}
