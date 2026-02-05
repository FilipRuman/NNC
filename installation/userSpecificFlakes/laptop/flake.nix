{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    machine.url = "path:./NNC";
    user.url = "path:./NNC/machines/laptop";
  };

  outputs = {
    self,
    nixpkgs,
    machine,
    user,
    ...
  } @ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs; # keep inputs available
        userModule = user.module; # assign pc.module to userModule
      };
      modules = [
        ./configuration.nix
        machine.module
      ];
    };
  };
}
