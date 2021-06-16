{pkgs, ...}:
{
    home.packages = with pkgs; [
        jq
        tree
        nixUnstable
    ];
}