{pkgs, ...}: {
  home.packages = [
    pkgs.hyprlock
  ];

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        no_fade_in = true;
        no_fade_out = true;
        ignore_empty_input = true;
      };
    };
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
      };
      listener = [
        {
          timeout = 60;
          on-timeout = "hyprlock";
        }
      ];
    };
  };
}
