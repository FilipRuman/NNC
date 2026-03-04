{
  flake.nixosModules.fUser = {
    users.users.f = {
      isNormalUser = true;
      description = "f";
      extraGroups = ["networkmanager" "wheel" "input" "uinput"];
    };
  };
}
