{
  flake.nixosModules.ctf = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      openssl_3
      john
      ghidra
    ];
  };
}
