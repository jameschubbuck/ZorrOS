{
  pkgs,
  zorrOS,
  ...
}: {
  stylix = {
    enable = true;
    image = ./floss.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${zorrOS.theme}.yaml";
    targets.plymouth.enable = false;
  };
}
