{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    keepassxc # Password manager
    qbittorrent #
    unar # Archive manager
    gimp # Image editor
    (bottles.override {removeWarningPopup = true;}) # Wine prefix manager
    mangohud # System info viewer
    inkscape # Vector editor
    bc # Basic calculator
    mpv # Media player
    ffmpeg
    librepods
    android-tools
    blender
    mailspring
    super-slicer
    (callPackage ./betterbird.nix {})
  ];
  programs.steam.enable = true;
  nixpkgs.config.allowUnfree = true;
  services.mullvad-vpn.enable = true;
  programs.fuse.userAllowOther = true;
}
