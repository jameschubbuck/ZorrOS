{
  pkgs,
  zorrOS,
  ...
}: {
  stylix = {
    enable = true;
    image = ./red_distortion_3.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${zorrOS.theme}.yaml";
    targets.plymouth.enable = false;
    cursor = {
      name = "Bibata-Original-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
    };
    fonts = {
      serif = {
        package = pkgs.geist-font;
        name = "Geist Sans";
      };
      sansSerif = {
        package = pkgs.geist-font;
        name = "Geist Sans";
      };
      monospace = {
        package = pkgs.nerd-fonts.geist-mono;
        name = "Geist Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
