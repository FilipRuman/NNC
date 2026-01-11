{
  description = "Flake for sellecting machine config";

  inputs = {
    pc.url = "path:./users/pc";
  };

  outputs = {pc, ...} @ inputs: {
    module = {...}: {
      imports = [
        pc.module
      ];
    };
  };
}
