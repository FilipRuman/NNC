{
  flake.nixosModules.rust = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      rust-analyzer
      rustfmt
      cargo
      rustc
    ];
  };
}
