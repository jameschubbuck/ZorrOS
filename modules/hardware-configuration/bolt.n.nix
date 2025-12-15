{pkgs, ...}: {
  services.hardware.bolt.enable = true;
  environment.systemPackages = [pkgs.bolt];
}
