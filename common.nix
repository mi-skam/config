{ pkgs, ... }:

{
  home.sessionVariables = {
    EDITOR = "emacs";
    PS1 = "\\u@\\h:\\w\\$ ";
  };

  home.packages = with pkgs; [
    # utils
    bashInteractive
    bat
    fd
    jq
    ranger
    ripgrep
    tree
    htop
    unzip

    # nix
    nixUnstable
    nixpkgs-fmt # nix code formatter
    rnix-lsp # nix language server

    # multimedia
    asciinema
    youtube-dl

    # security
    # metasploit

  ];

  programs = {
    autojump = {
      enable = true;
      enableBashIntegration = true;
    };
    bash = {
      enable = true;
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
    gh = {
      enable = true;
      aliases = {
        co = "pr checkout";
        pv = "pr view";
      };
      gitProtocol = "ssh";
    };
    git = {
      enable = true;
      userName = "mi-skam";
      userEmail = "maksim.codes@mailbox.org";
      signing.key = "8DFFF673";
      aliases = {
        co = "checkout";
        s = "status";
        p = "pull";
        c = "commit -S";
        l = "log --oneline";
      };
      delta.enable = true;
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
      };
      lfs.enable = true;
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
