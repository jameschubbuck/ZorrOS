{
  wayland.windowManager.hyprland = {
    settings = let
      baseBinds = [
        "G, exec, ghostty"
        "H, exec, helium --password-store=basic"
        "Super_L, exec, rofi -show drun"
        "Q, killactive"
        "F, exec, hyprctl dispatch fullscreenstate 2 0"
        "Escape, exec, hyprlock"
      ];
    in {
      bind = builtins.map (b: ''$mainMod, ${b}'') baseBinds;
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
