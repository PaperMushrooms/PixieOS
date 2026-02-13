{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.ssh = {
    extraConfig = ''
      Host github.com
        User git
        IdentityFile ~/.ssh/GitHub
        IdentitiesOnly yes

      Host pixie
        User dex
        Port 44906
        IdentityFile ~/.ssh/nixathon
        IdentitiesOnly yes

       Host drone
        User dex
        Port 44906
        IdentityFile ~/.ssh/nixathon
        IdentitiesOnly yes
    '';
  };
}
