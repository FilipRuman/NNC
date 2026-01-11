{
  description = "Flake for sellecting machine config";

  inputs = {
    pc.url = "path:./users/pc/flake.nix";
  };

  outputs = {...} @ inputs: {
    module = {...}: {
      imports = [
        pc.module
      ];
    };
  };
}
