{
  imports = [
    ./zsh.nix
  ];

  progtams.zathura = {
    enable = true;
    options = {
      synctex = true;
    };
  };
}
