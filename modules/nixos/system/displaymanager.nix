{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options = {
    pixieos.system.displaymanager.enable = mkEnableOption "Enable and Configure Display Manager";
  };

  config = mkIf config.pixieos.system.displaymanager.enable {
    services.displayManager.sddm.wayland.enable = true;
    services.displayManager.sddm.enable = true;
  };
}
