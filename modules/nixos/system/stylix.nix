{pkgs, ...}: {
  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/hardhacker.yaml";

    image = ../../../wallpapers/pixieos/aliens-chill.png;
  };
}
