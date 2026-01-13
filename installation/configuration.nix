{
  inputs,
  pkgs,
  ...
}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];

  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # userConf.pc.enable = true;

  system.stateVersion = "25.11";
}
