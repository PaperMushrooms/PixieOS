{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options = {pixieos.system.libreoffice.enable = mkEnableOption "Enable LibreOffice";};

  config = mkIf config.pixieos.system.libreoffice.enable {
    environment.systemPackages = with pkgs; [libreoffice-qt hunspell];
  };
}
