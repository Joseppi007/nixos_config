{pkgs, ...}: {
  xdg.configFile."sway" = {
    source = ./sway;
    executable = true;
    recursive = true;
  };
  home.packages = with pkgs; [
    wl-clipboard
    slurp
    grim
  ];
  home.sessionVariables = {
    QT_WAYLAND_DISABLE_WINDOWDECORATIONS = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };
  programs.rofi.package = pkgs.rofi.wayland;
}
