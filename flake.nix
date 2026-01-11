{
  description = "Flake for sellecting machine config";

  inputs = {
    pc.url = "path:./users/pc/flake.nix";
  };

  outputs = {
    pkgs,
    lib,
    pc,
    ...
  } @ inputs: {
    module = {
      pkgs,
      lib,
      ...
    }: {
      imports = [
        pc.module
      ];
    };
  };
}
