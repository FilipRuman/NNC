{
  description = "Flake for sellecting machine config";

  inputs = {
  };

  outputs = {self, ...}: {
    module = {userModule, ...}: {
      imports = [
        userModule
      ];
    };
  };
}
