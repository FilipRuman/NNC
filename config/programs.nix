{pkgs, ...}: {
  programs = {
    git = {
      enable = true;
    };
    hyprland = {
      enable = true;
    };
    steam = {
      enable = true;
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
  };
}
