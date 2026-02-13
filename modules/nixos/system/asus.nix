{
  config,
  lib,
  ...
}:
with lib; {
  options = {pixieos.system.asus.enable = mkEnableOption "Enable ASUS plugins";};

  config = mkIf config.pixieos.system.asus.enable {
    services = {
      asusd = {
        enable = true;
        enableUserService = true;
      };

      supergfxd.enable = true;

      # environment.systemPackages = [ pkgs.asusctl ];
    };
  };
}
