# PAM service for hyprlock with both password and fingerprint support
{
  config,
  pkgs,
  lib,
  ...
}: {
  # Hyprlock PAM - allow both password and fingerprint with proper ordering
  security.pam.services.hyprlock = {
    text = ''
      auth       optional                    pam_env.so
      auth       requisite                   ${pkgs.fprintd}/lib/security/pam_fprintd.so max_tries=3 timeout=5
      auth       sufficient                  ${pkgs.linux-pam}/lib/security/pam_unix.so try_first_pass nullok
      auth       required                    pam_deny.so

      account    include                     login

      password   sufficient                  ${pkgs.linux-pam}/lib/security/pam_unix.so nullok

      session    include                     login
    '';
  };
}
