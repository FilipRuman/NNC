{
  flake.nixosModules.ocaml = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      ocaml
      opam
      ocamlPackages.base
      dune_3
    ];
  };
}
