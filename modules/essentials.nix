{
  flake.nixosModules.essentials = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      steam-run
      btop
      appimage-run
    ];
    programs.git.enable = true;
  };
}
