{ config, ... }:

let
  theme = import ./palette.nix;
  c = theme.colors;
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  programs.rofi = {
    enable = true;

    extraConfig = {
      modi = "drun";
      font = "${theme.fontMono} 12";
      show-icons = true;
      icon-theme = theme.iconTheme;
      terminal = "foot";
      drun-display-format = "{name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      display-drun = " apps ";
      sidebar-mode = false;
    };

    theme = {
      "*" = {
        bg0 = mkLiteral "rgba(15, 17, 26, 0.93)";
        bg1 = mkLiteral "rgba(22, 25, 37, 0.98)";
        fg0 = mkLiteral "#${c.fg0}";
        accent = mkLiteral "#${c.accentBlue}";
        urgent = mkLiteral "#${c.danger}";
        bg-selected = mkLiteral "rgba(120, 166, 255, 0.18)";
      };

      "window" = {
        height = mkLiteral "650px";
        width = mkLiteral "860px";
        border = mkLiteral "2px";
        border-color = mkLiteral "@accent";
        background-color = mkLiteral "@bg0";
        border-radius = mkLiteral "14px";
        padding = mkLiteral "22px";
      };

      "mainbox" = {
        background-color = mkLiteral "transparent";
        children = map mkLiteral [ "inputbar" "listview" ];
      };

      "inputbar" = {
        background-color = mkLiteral "@bg1";
        text-color = mkLiteral "@fg0";
        border-radius = mkLiteral "12px";
        padding = mkLiteral "12px";
        margin = mkLiteral "0px 0px 14px 0px";
        children = map mkLiteral [ "prompt" "entry" ];
      };

      "prompt" = {
        enabled = true;
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@accent";
      };

      "entry" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@fg0";
        placeholder = "Launch";
        placeholder-color = mkLiteral "rgba(169, 177, 214, 0.3)";
      };

      "listview" = {
        background-color = mkLiteral "transparent";
        columns = 1;
        lines = 9;
        spacing = mkLiteral "8px";
        scrollbar = false;
        fixed-height = true;
      };

      "element" = {
        padding = mkLiteral "10px";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@fg0";
        border-radius = mkLiteral "10px";
      };

      "element-icon" = {
        size = mkLiteral "24px";
        margin = mkLiteral "0 10px 0 0";
        background-color = mkLiteral "transparent";
      };

      "element-text" = {
        vertical-align = mkLiteral "0.5";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
      };

      "element selected" = {
        background-color = mkLiteral "@bg-selected";
        text-color = mkLiteral "@accent";
        border = mkLiteral "1px";
        border-color = mkLiteral "@accent";
      };

      "error-message" = {
        padding = mkLiteral "20px";
        background-color = mkLiteral "@bg0";
        text-color = mkLiteral "@urgent";
      };
    };
  };
}
