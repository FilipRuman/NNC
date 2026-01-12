{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixConf.steam.enable = lib.mkEnableOption "enables steam ";
  };
  config = lib.mkIf config.nixConf.steam.enable {
    programs.steam = {
      enable = true;
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };
  };
}
