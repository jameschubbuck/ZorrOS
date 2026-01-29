{pkgs, ...}: {
  stylix = {
    targets = {
      rofi.enable = true;
      gtk = {
        enable = true;
        extraCss = ''
          window,.background,headerbar,.titlebar {
            background-color: rgba(30, 30, 46, 0.7);
            background-image: none;
            box-shadow: none;
          }
          textvview text,.view,textview {
            background-color: rgba(30, 30, 46, 0.5);
          }
        '';
      };
      ghostty.enable = true;
      fish.enable = true;
      opencode.enable = false;
      nvf = {
        enable = true;
        transparentBackground = true;
      };
      neovim = {
        enable = true;
        transparentBackground.main = true;
      };
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
    cursor = {
      name = "Bibata-Original-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };
}
