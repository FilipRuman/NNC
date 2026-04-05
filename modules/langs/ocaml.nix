{
  flake.nixosModules.ocaml = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      ocaml
      opam
      dune_3
    ];
  };
}
