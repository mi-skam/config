{ pkgs, ... }:
{
  home.sessionVariables = {
    EDITOR = "emacs";
  };

  home.packages = with pkgs; [
    bat
    fd
    jq
    ripgrep
    tree
    htop

    nixUnstable
    nixpkgs-fmt # nix code formatter
    rnix-lsp # nix language server
  ];

  programs= {
    autojump = {
      enable = true;
      enableBashIntegration = true;
    };
    bash = {
      enable = true;
      profileExtra = ''
        . /home/plumps/.nix-profile/etc/profile.d/nix.sh
      '';
    };
    emacs = {
      enable = true;
    };
    git = {
      enable = true;
      userName = "mi-skam";
      userEmail = "maksim.codes@mailbox.org";
    };
  };
}
