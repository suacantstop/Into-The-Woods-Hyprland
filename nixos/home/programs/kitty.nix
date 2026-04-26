{ pkgs, ... }:
let
  theme = import ./palette.nix;
  c = theme.colors;
in {
  programs.kitty = {
    enable = true;

    font = {
      name = theme.fontMono;
      size = 11;
    };

    settings = {
      shell = "${pkgs.fish}/bin/fish";
      window_padding_width = 10;
      background_opacity = "0.93";
      background_blur = 0;
      enable_audio_bell = false;
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      active_tab_font_style = "bold";
      inactive_tab_font_style = "normal";

      foreground = "#${c.fg0}";
      background = "#${c.bg0}";
      selection_foreground = "#${c.fg0}";
      selection_background = "#${c.bg3}";
      url_color = "#${c.accentCyan}";
      cursor = "#${c.accentBlue}";
      cursor_text_color = "#${c.bg0}";
      active_border_color = "#${c.accentBlue}";
      inactive_border_color = "#${c.bg3}";
      bell_border_color = "#${c.danger}";

      color0 = "#${c.bg1}";
      color8 = "#${c.bg3}";

      color1 = "#${c.danger}";
      color9 = "#${c.danger}";

      color2 = "#${c.accentGreen}";
      color10 = "#${c.accentGreen}";

      color3 = "#${c.accentPeach}";
      color11 = "#${c.accentPeach}";

      color4 = "#${c.accentBlue}";
      color12 = "#${c.accentBlue}";

      color5 = "#${c.accentViolet}";
      color13 = "#${c.accentViolet}";

      color6 = "#${c.accentCyan}";
      color14 = "#${c.accentCyan}";

      color7 = "#${c.fg1}";
      color15 = "#${c.fg0}";
    };

    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
      "ctrl+plus" = "change_font_size all +1";
      "ctrl+equal" = "change_font_size all +1";
      "ctrl+kp_add" = "change_font_size all +1";
      "ctrl+minus" = "change_font_size all -1";
      "ctrl+underscore" = "change_font_size all -1";
      "ctrl+kp_subtract" = "change_font_size all -1";
      "ctrl+0" = "change_font_size all 0";
      "ctrl+kp_0" = "change_font_size all 0";
    };

    extraConfig = "";
  };
}
