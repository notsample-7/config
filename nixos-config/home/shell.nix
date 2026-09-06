{ pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      eval "$(direnv hook bash)"
    '';

    shellAliases = {
      # Nix management
      nu = "nix flake update --flake ~/config/nixos-config";
      nrs = "sudo nixos-rebuild switch --flake ~/config/nixos-config#sample";
      nru = "nu && nrs";
      ncg = "sudo nix-collect-garbage -d";
      nso = "sudo nix store optimise";

      # Files & navigation
      cfg = "cd ~/config";
      gh = "cd ~/Projects/github";
      cb = "cd ~/Projects/codeberg";
      stowall = "cd ~/config/dotfiles && stow -t ~ * && cd -";
      ls = "eza -lh --group-directories-first --icons=auto";
      dust = "dust -s -r -x";
      ff = "fzf --preview 'bat --style=numbers --color=always {}'";
      ya = "yazi";

      # Editors & tools
      op = "opencode";
      emacs = "emacsclient -c & disown";
      pg = "pgadmin4";

      # Misc
      a = "alias | bat -l bash";
      btw = "echo i use nixos btw";
    };
  };

  programs.fzf = {
      enable = true;
      enableBashIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

  home.packages = with pkgs; [
    bash-completion
  ];
}
