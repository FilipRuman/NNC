{
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Warsaw";
  services.tailscale.enable = true;
}
