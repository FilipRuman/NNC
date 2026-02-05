{lib, ...}: let
  words = [
    "Multimesh"
    "upd"
    "Upd"
    "lod"
    "Lod"
    "LOD"
    "uvs"
    "Hyprland"
    "hyprland"
    "Hyprlock"
    "hyprlock"
    "Waypaper"
    "wyapaper"
    "Waybar"
    "waybar"
    "Wayland"
    "wayland"
    "gdshader"
    "GdShader"
    "math"
    "Math"
    "MathF"
    "Mathf"
    "mathf"
    "biome"
    "Biome"
    "biomes"
    "Biomes"
    "Albedo"
    "albedo"
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
