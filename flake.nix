{
  description = "Home Manager nixvim configuration of myc0plasmus";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:/nixos/nixpkgs?ref=nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    let
      mkPkgs = system:
        import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
    in
    {
      nixvimModule = {config, pkgs, lib, ...}:
      let
        pkgs' = mkPkgs pkgs.stdenv.hostPlatform.system;
      in
      import ./neovim.nix {
        inherit  config pkgs lib inputs;
        internalPkgs=pkgs';
      };
    };
}
