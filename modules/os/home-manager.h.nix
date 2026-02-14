{zorrOS, ...}: {
  home = {
    username = zorrOS.username;
    homeDirectory = "/home/${zorrOS.username}";
    stateVersion = "25.05";
  };
  programs.home-manager.enable = true;
}
