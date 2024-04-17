{pkgs, ...}: {
  home.packages = with pkgs; [
    gh
    pass
    neofetch
    gnumake
  ];
}
