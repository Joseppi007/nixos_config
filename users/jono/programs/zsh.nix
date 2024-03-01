{config, pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    dotDir = "~/.config/zsh";
    history = {
      ignoreSpace = true;
      path = "${config.xdg.dataHome}/zsh/zsh_history";
      save = 1000;
    };
    historySubstringSearch.enable = true;
    initExtra = ''
      PROMPT="%F{10}%n$ %F{15}"
      echo -e "\033[3J\033[1;1H\033[1;32mWelcome to NixOS!\033[0m"
    '';
  };
}
