{
  flake.nixosModules.vm = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      quickemu
      qemu
    ];
  };
}
