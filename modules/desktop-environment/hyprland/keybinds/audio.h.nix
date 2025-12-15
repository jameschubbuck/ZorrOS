{pkgs, ...}: let
  update-audio-script = pkgs.writeShellScriptBin "update-audio" (
    builtins.readFile ./update-audio
  );
in {
  home.packages = with pkgs; [
    pipewire
    libnotify
    gnugrep
    bc
    gawk
    coreutils
    gnused
  ];
  wayland.windowManager.hyprland.settings.bindl = [
    ",XF86AudioRaiseVolume, exec, ${update-audio-script}/bin/update-audio raise"
    ",XF86AudioLowerVolume, exec, ${update-audio-script}/bin/update-audio lower"
    ",XF86AudioMute, exec, ${update-audio-script}/bin/update-audio toggle"
  ];
}
