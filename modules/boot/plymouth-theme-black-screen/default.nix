{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "plymouth-theme-black-screen";
  version = "1.0";

  src = lib.cleanSource ./.;

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/plymouth/themes/black-screen
    cp black-screen.plymouth $out/share/plymouth/themes/black-screen/
    cp black-screen.script $out/share/plymouth/themes/black-screen/
  '';

  meta = with lib; {
    description = "A simple black screen Plymouth theme";
    homepage = "https://github.com/yourusername/plymouth-theme-black-screen";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
