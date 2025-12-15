{pkgs, ...}: let
  workspace-script = pkgs.writeShellScript "hypr-workspace-op" ''
    operation="$1"
    ws_num="$2"
    if ! ${pkgs.hyprland}/bin/hyprctl layers | ${pkgs.gnugrep}/bin/grep -q "rofi"; then
      if [ "$operation" = "move" ]; then
        ${pkgs.hyprland}/bin/hyprctl dispatch movetoworkspace "$ws_num"
      elif [ "$operation" = "change" ]; then
        ${pkgs.hyprland}/bin/hyprctl dispatch workspace "$ws_num"
      fi
    fi
  '';
in {
  wayland.windowManager.hyprland = {
    settings = {
      bind =
        (
          builtins.concatLists (
            builtins.genList
            (
              i: let
                ws = i + 1;
                ws_key = toString ws;
              in [
                "\$mainMod, ${ws_key}, exec, ${workspace-script} change ${ws_key}"

                "\$mainMod SHIFT, ${ws_key}, exec, ${workspace-script} move ${ws_key}"
              ]
            )
            9
          )
        )
        ++ [
          "$mainMod, 0, exec, ${workspace-script} change 10"
          "$mainMod SHIFT, 0, exec, ${workspace-script} move 10"
        ];
    };
  };
}
