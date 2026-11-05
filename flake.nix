{
  description = "Apache NuttX development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        python = pkgs.python3.withPackages (
          ps: with ps; [
            kconfiglib
            pyelftools
            cxxfilt
          ]
        );
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # Build system
            gnumake
            cmake
            ninja
            gcc
            binutils
            gcc-arm-embedded

            # Autotools
            autoconf
            automake
            libtool
            gnum4

            # Configuration
            bison
            flex
            gperf
            ncurses

            # NuttX utilities
            genromfs
            gettext
            texinfo
            xxd

            # Python
            python

            # Development
            git
            pkg-config
            picocom
          ];

          shellHook = ''
            echo "Apache NuttX development environment"
            echo "Python: $(python3 --version)"
            echo "Make: $(make --version | head -n 1)"
          '';
        };
      }
    );
}
