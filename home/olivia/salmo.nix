{inputs, ...}:
{
  imports = [
    ./global
    ./local/montana
  ];

  home = {
    username = "olivia";
    homeDirectory = "/home/olivia";

    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
