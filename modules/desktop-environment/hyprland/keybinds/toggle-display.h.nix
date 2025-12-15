{pkgs, ...}: let
  toggleInternalDisplayScript = pkgs.writeShellScriptBin "toggle-internal-display-nix" ''
    INTERNAL_DISPLAY="eDP-1"
    MONITOR_COUNT=$(hyprctl monitors | ${pkgs.gnugrep}/bin/grep -c "^Monitor")
    if [ "$MONITOR_COUNT" -gt 1 ]; then
        hyprctl keyword monitor "$INTERNAL_DISPLAY, disable"
    else
        hyprctl keyword monitor "$INTERNAL_DISPLAY,highrr,auto,auto"
    fi
  '';
in {
  wayland.windowManager.hyprland.settings.bind = [
    "$mainMod, D, exec, ${toggleInternalDisplayScript}/bin/toggle-internal-display-nix"
  ];
}
