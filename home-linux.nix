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

  programs = {
    autojump = {
      enable = true;
      enableBashIntegration = true;
    };
    bash = {
      enable = true;
      bashrcExtra = ''
        export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock

        ss -a | grep -q $SSH_AUTH_SOCK
        if [ $? -ne 0 ]; then
            rm -f $SSH_AUTH_SOCK
            (setsid ${pkgs.socat}/bin/socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"${pkgs.npiperelay}/bin/npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork &) >/dev/null 2>&1
        fi       
      '';
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
    gh = {
      enable = true;
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
