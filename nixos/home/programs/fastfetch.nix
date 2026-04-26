{ ... }: {
  programs.fastfetch = {
    enable = true;
    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";

      logo = {
        type = "kitty-icat";
        source = "NixOS";
        width = 10;
        height = 10;
        padding = {
          top = 1;
          left = 1;
        };
      };

      display = {
        separator = " -> ";
        color = {
          keys = "cyan";
        };
      };

      modules = [
        {
          type = "custom";
          format = "Into the Woods // Contest Edition";
        }
        {
          type = "custom";
          format = "────────────────────────────────";
        }
        {
          key = "  user";
          type = "title";
          format = "{user-name}@{host-name}";
        }
        {
          key = "  os";
          type = "os";
        }
        {
          key = "  kernel";
          type = "kernel";
        }
        {
          key = "  shell";
          type = "shell";
        }
        {
          key = "  wm";
          type = "wm";
        }
        {
          key = "  cpu";
          type = "cpu";
        }
        {
          key = "  memory";
          type = "memory";
        }
        {
          key = "  disk";
          type = "disk";
          folders = "/";
        }
        {
          type = "custom";
          format = "────────────────────────────────";
        }
        {
          type = "colors";
          paddingLeft = 1;
          symbol = "circle";
        }
      ];
    };
  };
}
