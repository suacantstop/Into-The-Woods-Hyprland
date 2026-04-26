{ ... }:
let
  theme = import ./palette.nix;
  c = theme.colors;
in {
  programs.fish = {
    enable = true;

    shellAliases = {
      ls = "lsd";
      la = "lsd -a";
      ll = "lsd -lah";
      ".." = "cd ..";
      "..." = "cd ../..";

      nvf = "nvim";
      snvf = "sudo nvim";

      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gcl = "git clone";
      gp = "git push";
      gpom = "git push origin main";

      r = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      u = "sudo nix flake update";

      cb = "cargo build";
      cr = "cargo run";
      grep = "grep --color=auto";
    };

    functions = {
      fish_prompt = {
        body = ''
          set -l dir (prompt_pwd)
          set -l branch (fish_vcs_prompt)
          echo -n "$dir$branch  > "
        '';
      };

      fish_right_prompt = {
        body = ''
          echo -n (date "+%H:%M")
        '';
      };

      fish_command_not_found = {
        body = ''
          if test (count $argv) -gt 0
              if string match -qr '^[0-9+\-*/.^() ]+$' -- "$argv[1]"
                  math "$argv[1]"
                  return
              end
              echo "fish: Unknown command: $argv[1]"
          end
        '';
      };

      "=" = {
        body = ''
          set -l expr (string join " " $argv)
          if test -z "$expr"
              echo "usage: = <expression>"
              return 1
          end
          python3 -c "import math; print($expr)"
        '';
      };

      calc = {
        body = ''
          set -l expr (string join " " $argv)
          if test -z "$expr"
              echo "usage: calc <expression>"
              return 1
          end
          python3 -c "from math import *; print($expr)"
        '';
      };
    };

    interactiveShellInit = ''
      set -g fish_greeting ""
      set -g fish_color_normal ${c.fg0}
      set -g fish_color_command ${c.accentBlue}
      set -g fish_color_keyword ${c.accentViolet}
      set -g fish_color_param ${c.fg0}
      set -g fish_color_error ${c.danger}
      set -g fish_color_cwd ${c.accentCyan}
      set -g fish_color_valid_path ${c.accentGreen}
      set -g fish_color_search_match --background=${c.bg3}
      set -g fish_color_selection --background=${c.bg3}
      set -g fish_pager_color_prefix ${c.accentBlue}
      set -g fish_pager_color_completion ${c.fg0}
      set -g fish_pager_color_description ${c.fg1}

      if status is-interactive
          if test -z "$FASTFETCH_DONE"
              set -gx FASTFETCH_DONE 1
              fastfetch
          end
      end
    '';
  };
}
