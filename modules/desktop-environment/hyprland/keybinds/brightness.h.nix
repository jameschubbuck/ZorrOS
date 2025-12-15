{pkgs, ...}: let
  # sudo ddcutil --bus=16 setvcp 12 [0/100]; ddcutil --bus=16 setvcp 10 [0/100]
  update-brightness-script = pkgs.writeShellScriptBin "update-brightness" ''
    readonly NOTIFY_ID=9910
    readonly NOTIFY_TIMEOUT=2000
    case "$1" in
    raise)
        brightnessctl set 10%+
        ;;
    lower)
        brightnessctl set 10%-
        ;;
    esac
    if [ $? -eq 0 ]; then
        CURRENT_BRIGHTNESS=$(brightnessctl info | grep -oP '\(\K\d+%' | head -n 1)
        NOTIFY_BODY="$CURRENT_BRIGHTNESS"
        notify-send \
            --urgency=low \
            --expire-time="$NOTIFY_TIMEOUT" \
            --replace-id="$NOTIFY_ID" \
            "Display Brightness" \
            "$NOTIFY_BODY"
    fi
    exit 0
  '';
in {
  home.packages = with pkgs; [brightnessctl libnotify gnugrep];
  wayland.windowManager.hyprland.settings.bindl = [
    ",XF86MonBrightnessUp, exec, ${update-brightness-script}/bin/update-brightness raise"
    ",XF86MonBrightnessDown, exec, ${update-brightness-script}/bin/update-brightness lower"
  ];
}
