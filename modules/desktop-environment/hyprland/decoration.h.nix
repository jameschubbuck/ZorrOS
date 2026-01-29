{zorrOS, ...}: {
  wayland.windowManager.hyprland = {
    settings = {
      general = {
        "gaps_in" = zorrOS.padding;
        "gaps_out" = zorrOS.padding;
        "border_size" = "1";
      };
      decoration = {
        "rounding" = zorrOS.padding;
        shadow = {
          "enabled" = "true";
        };
        blur = {
          "enabled" = "false";
        };
      };
      animations = {
        "enabled" = "true";
        "animation" = "global, 1, 2, default";
      };
      misc = {
        "force_default_wallpaper" = "0";
      };
    };
  };
}
