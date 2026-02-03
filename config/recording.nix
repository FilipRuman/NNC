{pkgs, ...}: {
  programs.gpu-screen-recorder.enable = true;
  environment.systemPackages = with pkgs; [
    gpu-screen-recorder-gtk # GUI app
    gpu-screen-recorder
  ];
}
