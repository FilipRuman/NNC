{
  description = "Flake for sellecting machine config";

  inputs = {
    pc.url = "path:./users/pc/flake.nix";
  };

  outputs = {
    pkgs,
    lib,
    config,
    pc,
    ...
  } @ inputs: {
    module = {
      pkgs,
      lib,
      config,
      ...
    }: {
      imports = [
        pc.module
      ];
    };
  };
}
