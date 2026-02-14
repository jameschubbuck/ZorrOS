{zorrOS, ...}: {
  programs = {
    ghostty = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        window-padding-x = zorrOS.padding;
        command = "fish";
        background-opacity = zorrOS.opacity;
        window-padding-color = "extend";
      };
    };
  };
}
