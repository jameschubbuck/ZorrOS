{pkgs, ...}: {
  home.packages = with pkgs; [
    lsd
    tree
    grc
    ripgrep
    wl-clipboard-rs
    waybar
  ];
  programs = {
    fish = {
      enable = true;
      generateCompletions = true;
      interactiveShellInit = ''
        set -g fish_greeting ""
        bind \t forward-char
        bind \e\[C complete
      '';
      plugins = [
        {
          name = "transient-fish";
          src = pkgs.fishPlugins.transient-fish.src;
        }
        {
          name = "puffer";
          src = pkgs.fishPlugins.puffer.src;
        }
        {
          name = "pure";
          src = pkgs.fishPlugins.pure.src;
        }
        {
          name = "sudope";
          src = pkgs.fishPlugins.plugin-sudope.src;
        }
        {
          name = "pisces";
          src = pkgs.fishPlugins.pisces.src;
        }
        {
          name = "done";
          src = pkgs.fishPlugins.done.src;
        }
        {
          name = "sponge";
          src = pkgs.fishPlugins.sponge.src;
        }
      ];
      shellAliases = {
        "v" = "vi";
        "ls" = "lsd --group-directories-first --ignore-glob='__pycache__' --ignore-glob='*.lock'";
        "tree" = "tree -I '__pycache__|*.lock'";
        "nix-shell" = "nix-shell --command 'fish'";
        "librepods" = "/etc/nixos/modules/packages/librepods.sh";
        "oc" = "opencode";
        "logout" = "loginctl terminate-user $USER";
      };
      functions = {
        c = {
          body = ''
            cat $argv | wl-copy
          '';
        };
      };
    };
  };
}
