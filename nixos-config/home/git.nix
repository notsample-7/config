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

    includes = [
      {
        condition = "gitdir:~/Projects/github/";
        contents = {
          user = {
            email = "224307167+notsample-7@users.noreply.github.com";
            name = "notsample-7";
          };
        };
      }
      {
        condition = "gitdir:~/Projects/codeberg/";
        contents = {
          user = {
            email = "notsample-7@noreply.codeberg.org";
            name = "notsample-7";
          };
        };
      }
    ];
  };

  # Lazygit configuration (optional)
  programs.lazygit = {
    enable = true;
  };
}
