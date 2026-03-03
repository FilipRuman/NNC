{
  flake.nixosModules.networking = {lib, ...}: {
    networking.hostName = "nixos"; # define your hostname.
    networking.networkmanager.enable = true;
    time.timeZone = "europe/warsaw";
    services.tailscale.enable = true;
    systemd.services.NetworkManager-wait-online.wantedBy = lib.mkForce [];
  };
}
