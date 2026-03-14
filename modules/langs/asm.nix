{
  flake.nixosModules.asm = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      nasm
    ];
  };
}
