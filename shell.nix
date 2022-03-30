let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {
    overlays = [
      (pkgs: _: {
        poetry2nix = import sources.poetry2nix {
          inherit pkgs;
          inherit (pkgs) poetry;
        };
      })
    ];
  };
  myPoetryEnv = pkgs.poetry2nix.mkPoetryEnv {
    python = pkgs.python310;
    projectDir = ./.;
  };
in
pkgs.mkShell {
  name = "poetry-env-shell";
  buildInputs = with pkgs; [ niv poetry myPoetryEnv ];
}
