{inputs, ...}: {
  flake-file.inputs.davinci-resolve.url = "github:creatorkostas/davinci-resolve-nixos";

  flake.nixosModules.davinci = {pkgs,davinci-resolve, ...}: {
          environment.systemPackages = [
            davinci-resolve.packages.${pkgs.system}.davinci-resolve
          ];
  };
}
