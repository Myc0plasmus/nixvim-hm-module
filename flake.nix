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
    {
      nixvimModule = {config, pkgs, lib, ...}:
      import ./neovim.nix {
        inherit  config pkgs lib inputs;
      };
    };
}
