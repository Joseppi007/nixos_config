{
  imports = [
    ./zsh.nix
  ];

  programs.zathura = {
    enable = true;
    options = {
      synctex = true;
    };
  };
}
