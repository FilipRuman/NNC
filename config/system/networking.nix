{lib, ...}: {
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Warsaw";
  services.tailscale.enable = true;
  systemd.services.NetworkManager-wait-online.wantedBy = lib.mkForce [];
}
