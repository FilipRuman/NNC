{
  flake.nixosModules.terminalEnhancements = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      wget
      fastfetch
      fzf
      fd
      starship
      zoxide
      f3d
      yazi
      ripgrep
      fd
      fish
      delta # git diff
      libqalculate
      lazygit
      lf
      zip
      unrar
      unzip
    ];
  };
}
