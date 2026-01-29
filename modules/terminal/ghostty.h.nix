{zorrOS, ...}: {
  programs = {
    ghostty = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        window-padding-x = zorrOS.padding;
        window-padding-y = zorrOS.padding;
        command = "fish";
        background-opacity = zorrOS.opacity;
      };
    };
  };
}
