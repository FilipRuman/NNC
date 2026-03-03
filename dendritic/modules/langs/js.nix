{
  flake.nixosModules.js = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      yarn
      nodePackages_latest.nodejs
    ];
  };
}
