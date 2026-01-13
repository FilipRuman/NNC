{
  lib,
  config,
  pc,
  ...
}: {
  options.userConf.pc.enable =
    lib.mkEnableOption "enables the pc user";

  config = lib.mkIf config.userConf.pc.enable {
    imports = [pc.module];
  };
}
