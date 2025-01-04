# shell.nix
let
  nixpkgs = import (fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/nixpkgs-unstable.tar.gz";
    }) { };  # Import nixpkgs as a package set
in
nixpkgs.mkShell {
  name = "beguelins-dev";

  buildInputs = with nixpkgs; [
      git          # Git for version control
      go           # Go (required by Hugo)
      hugo         # Hugo for static website generation
      dart-sass     # Dart Sass for CSS preprocessing
    ];

  shellHook = ''
    echo "Welcome to beguelins.net development environment!"
    echo "Installed software versions:"
    echo "  - Git ($(git --version))"
    echo "  - Go ($(go version))"
    echo "  - Hugo ($(hugo version))"
    echo "  - Dart Sass ($(sass --version))"
  '';
}
