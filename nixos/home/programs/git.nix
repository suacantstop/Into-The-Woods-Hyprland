{ ... }: {
  programs.git = {
    enable = true;

    settings = {
      init.defaultBranch = "main";
      pull.rebase = false;
      push.autoSetupRemote = true;
      color.ui = true;

      user = {
        name = "user";
        email = "email";
      };
    };
  };
}
