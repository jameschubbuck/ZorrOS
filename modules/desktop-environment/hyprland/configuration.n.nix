{
  pkgs,
  inputs,
  ...
}: {
  programs = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.default;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      withUWSM = false;
    };
  };
  fonts.packages = with pkgs; [
    nerd-fonts.geist-mono
  ];
}
