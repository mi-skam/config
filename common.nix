{ pkgs, ... }:

{
  home.sessionVariables = {
    EDITOR = "vim";
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

    nixpkgs-fmt # nix code formatter
    rnix-lsp # nix language server

    # multimedia
    youtube-dl


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
        d = "diff";
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
    neovim = {
      enable = true;
      vimAlias = true;
      plugins = with pkgs.vimPlugins; [ ale vim-polyglot ];
      coc = {
        enable = true;
      };
      extraConfig = ''
        nmap <F6> :ALEFix<CR>
      '';
    };
  };
  xdg.configFile."nvim/ftplugin/javascript.vim".text = ''
    " Fix files with prettier, and then ESLint.
    let b:ale_fixers = ['prettier', 'eslint']
    " Equivalent to the above.
    let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
    '';
  services = {
    gpg-agent = {
      enable = true;
      pinentryFlavor = "tty";
    };
  };
}
