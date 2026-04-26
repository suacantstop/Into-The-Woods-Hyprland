{ pkgs, ... }:
let
  theme = import ./palette.nix;
  c = theme.colors;
in {
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = { family = theme.fontMono; style = "SemiBold"; };
        size = 9.0;
      };
      terminal.shell.program = "${pkgs.fish}/bin/fish";
      window = {
        opacity = 0.85;
        padding = { x = 8; y = 8; };
      };
      colors = {
        primary = {
          background = "#1d2021";
          foreground = "#ebdbb2";
        };
        normal = {
          black = "#1d2021";
          red = "#cc241d";
          green = "#98971a";
          yellow = "#d79921";
          blue = "#458588";
          magenta = "#b16286";
          cyan = "#689d6a";
          white = "#a89984";
        };
        bright = {
          black = "#928374";
          red = "#fb4934";
          green = "#b8bb26";
          yellow = "#fabd2f";
          blue = "#83a598";
          magenta = "#d3869b";
          cyan = "#8ec07c";
          white = "#ebdbb2";
        };
      };
    };
  };
}