{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # Optional, if you intend to follow nvf's obsidian-nvim input
    # you must also add it as a flake input.

    # Required, nvf works best and only directly supports flakes
    nvf = {
      url = "github:NotAShelf/nvf";
    };
  };

  outputs = {nixpkgs, ...} @ inputs: {
    module = {...}: {
      imports = [inputs.nvf.nixosModules.default];
      programs.nvf = {
        enable = true;
        settings = ./config/main.nix;
      };
    };
  };
}
