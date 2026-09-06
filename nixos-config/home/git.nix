{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      core.editor = "emacsclient";
      user = {
        name = "notsample-7";
        email = "224307167+notsample-7@users.noreply.github.com";
      };
      init.defaultBranch = "main";
    };

    extraConfig = {
      "includeIf \"gitdir:~/Projects/github/\".path"   = "~/.config/git/email-github";
      "includeIf \"gitdir:~/Projects/codeberg/\".path" = "~/.config/git/email-codeberg";
    };
  };

  home.file.".config/git/email-github".text = ''
    [user]
      name = notsample-7
      email = 224307167+notsample-7@users.noreply.github.com
  '';

  home.file.".config/git/email-codeberg".text = ''
    [user]
      name = notsample-7
      email = notsample-7@noreply.codeberg.org
  '';

  # Lazygit configuration (optional)
  programs.lazygit = {
    enable = true;
    # settings = { ... }; # Add custom lazygit settings if needed
  };
}
