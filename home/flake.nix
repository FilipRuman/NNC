{
  description = "Home Manager config for f";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    ...
  }: {
    f = {
      home-manager = {
        extraSpecialArgs = {inherit inputs;};
        users = {
          "f" = import ./home.nix;
        };
        backupFileExtension = "home-managebak";
      };
    };
  };
}
