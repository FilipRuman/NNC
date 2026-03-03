{
  flake.nixosModules.cs = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      mono
      dotnetCorePackages.sdk_10_0-bin
    ];
  };
}
