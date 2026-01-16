{
  config,
  lib,
  ...
}: let
  words = [
    "Nim"
    "DotNet"
    "nim"
    "codebook"
    "Nixpkgs"
    "nixpkgs"
    "Nix"
    "Nixos"
    "nix"
    "nixos"
    "Shader"
    "shader"
    "keymaps"
    "pkgs"
    "NVF"
    "NNC"
    "config"
    "nvf"
    "yazi"
    "nvim"
    "rustc"
    "Esc"
    "ctf"
    "CTF"
  ];
  # Convert list of strings → TOML array
  wordsToml =
    "words = ["
    + lib.concatStringsSep ", "
    (map (w: "\"${w}\"") words)
    + "]\n";
in {
  xdg.configFile = {
    "harper/custom.dict".text =
      lib.concatStringsSep "\n" words + "\n";
    "codebook/codebook.toml".text =
      wordsToml + builtins.readFile ./codebook.toml;
  };
}
