{
  flake.nixosModules.c = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      ninja
      glibc.dev
      man-pages
      clang
      gnumake
      clang-tools
      cmake
      gcc
    ];
  };
}
