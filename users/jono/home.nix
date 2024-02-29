{pkgs, ...}: {
  imports = [
    ./programs
    ./wayland
  ];
  home = {
    username = "jono";
    homeDirectory = "/home/jono";
    stateVersion = "23.11";
    sessionVariables = {
      EDITOR = "vim";
    };
    sessionPath = [
      "$HOME/.local/bin"
    ];
    packages = with pkgs; [
      mpv
      tree
      gimp
      prismlauncher
      discord
      zathura
      comic-mono
      pandoc
      pdftk
      git
      lua
      python3
      htop
      p7zip
      gcc
      gnumake
      rtorrent
      texliveFull
      zsh
    ];
  };
  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = ["org.pwmt.zathura-pdf-mupdf.desktop"];
      };
    };
  };
  programs.home-manager.enable = true;
}
