{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # Optional, if you intend to follow nvf's obsidian-nvim input
    # you must also add it as a flake input.

    # Required, nvf works best and only directly supports flakes
    obsidian-nvim.url = "github:epwalsh/obsidian.nvim";
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.obsidian-nvim.follows = "obsidian-nvim"; # <- this will use the obsidian-nvim from your inputs
    };
  };

  outputs = {nixpkgs, ...} @ inputs: {
    module = {pkgs, ...}: {
      imports = [inputs.nvf.nixosModules.default];
      programs.nvf = {
        enable = true;
        settings = ./config/main.nix;
      };
      environment.systemPackages = with pkgs; [
        # imagemagick
        # ueberzugpp
      ];
    };
  };
}
