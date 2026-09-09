{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      core.editor = "emacsclient";
      user = {
        name = "notsample-7";
        email = "git.sample7@proton.me";
      };
      init.defaultBranch = "main";
    };
  };

  # Lazygit configuration (optional)
  programs.lazygit = {
    enable = true;
  };
}
