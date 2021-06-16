{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jq
    tree
    htop

    nixUnstable
    nixpkgs-fmt # nix code formatter
    rnix-lsp # nix language server
  ];

  programs.git = {
    enable = true;
    userName = "mi-skam";
    userEmail = "maksim.codes@mailbox.org";
  };
}
