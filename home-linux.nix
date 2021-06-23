{ pkgs, ... }:
{
  home.sessionVariables = {
    EDITOR = "emacs";
  };

  home.packages = with pkgs; [
    bash-completion
    bat
    fd
    jq
    ranger
    ripgrep
    tree
    htop
    unzip

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
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv = {
        enable = true;
	enableFlakes = true;
      };
    };
    emacs = {
      enable = true;
    };
    git = {
      enable = true;
      userName = "mi-skam";
      userEmail = "maksim.codes@mailbox.org";
      signing.key = "8DFFF673";
    };
    gpg = {
      enable = true;
    };
  };
  services = {
    gpg-agent = {
      enable = true;
      pinentryFlavor = "tty";
    };
  };
}
