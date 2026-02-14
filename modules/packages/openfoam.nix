{pkgs ? import <nixpkgs> {}}: let
  inherit (pkgs) stdenv lib fetchFromGitHub bash m4 flex bison fftw gnumake openmpi scotch boost cgal zlib trilinos makeWrapper;

  # 1. The Heavy Build (The "Dist")
  # Compiles the C++ source. This is cached once successful.
  openfoam-dist = stdenv.mkDerivation rec {
    pname = "openfoam-org-dist";
    version = "12";

    src = fetchFromGitHub {
      owner = "OpenFOAM";
      repo = "OpenFOAM-12";
      rev = "version-12";
      hash = "sha256-++WRLffDiFeYo5Fv3zBjgmV+PqwYTTtuvqjx4iKF5RI=";
    };

    nativeBuildInputs = [gnumake bash m4 flex bison];
    buildInputs = [fftw openmpi scotch boost cgal zlib trilinos];

    sourceRoot = ".";

    patchPhase = ''
      runHook prePatch
      mkdir -p builduser/OpenFOAM
      export HOME=$(pwd)/builduser
      mv source builduser/OpenFOAM/OpenFOAM-12
      cd builduser/OpenFOAM/OpenFOAM-12

      # Patch wmake to use the Nix bash path
      find wmake -type f -print0 | while IFS= read -r -d $'\0' file; do
        if grep -q "/bin/bash" "$file"; then
          substituteInPlace "$file" --replace-quiet "/bin/bash" "${bash}/bin/bash"
        fi
      done

      # Prevent 'set -e' from killing the shell if the environment script has minor issues
      sed -i '1i set +e' etc/bashrc
      sed -i '1i set +e' Allwmake

      # Silence bash completion errors
      find etc -name "bash_completion" -exec sed -i 's/^complete/# complete/g' {} +

      # Force System MPI settings in the built-in preferences
      echo "export WM_MPLIB=SYSTEMOPENMPI" >> etc/prefs.sh
      echo "export ZOLTAN_TYPE=system" >> etc/prefs.sh
      echo "export SCOTCH_TYPE=system" >> etc/prefs.sh

      runHook postPatch
    '';

    buildPhase = ''
      runHook preBuild
      cd $HOME/OpenFOAM/OpenFOAM-12
      source ./etc/bashrc
      ./Allwmake -j $NIX_BUILD_CORES -q -k
      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall
      mkdir -p $out/opt/OpenFOAM-12
      cd $HOME/OpenFOAM/OpenFOAM-12
      cp -r bin platforms etc applications src doc tutorials $out/opt/OpenFOAM-12/
      runHook postInstall
    '';
  };

  # 2. Runtime Environment
  runtimeDeps = [
    openmpi
    gnumake
    pkgs.gcc
    pkgs.binutils
    pkgs.coreutils
    pkgs.gnused
    pkgs.gnugrep
    pkgs.procps
  ];
in
  # 3. The Wrapper (Lightweight)
  # This section generates the 'openfoam12' command instantly.
  stdenv.mkDerivation {
    pname = "openfoam-org";
    inherit (openfoam-dist) version;

    dontUnpack = true;
    dontBuild = true;

    nativeBuildInputs = [makeWrapper];

    installPhase = ''
      mkdir -p $out/bin
      mkdir -p $out/opt
      ln -s ${openfoam-dist}/opt/OpenFOAM-12 $out/opt/OpenFOAM-12

      # The magic happens here:
      # We explicitly set MPI_ARCH_PATH so OpenFOAM doesn't run 'mpicc' to find it.
      makeWrapper ${bash}/bin/bash $out/bin/openfoam12 \
        --prefix PATH : ${lib.makeBinPath runtimeDeps} \
        --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath runtimeDeps}" \
        --set MPI_ARCH_PATH "${openmpi}" \
        --set FOAM_MPI "openmpi-system" \
        --add-flags "--rcfile $out/opt/OpenFOAM-12/etc/bashrc"
    '';

    meta = openfoam-dist.meta;
  }
