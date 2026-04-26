{ pkgs, lib, ... }:
let
  theme = import ./palette.nix;
  c = theme.colors;
in {
  gtk = {
    enable = true;

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    cursorTheme = {
      name = theme.cursorTheme;
      package = pkgs.phinger-cursors;
      size = theme.cursorSize;
    };

    iconTheme = {
      name = theme.iconTheme;
      package = pkgs.papirus-icon-theme;
    };

    font = {
      name = theme.fontUi;
      size = 11;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "gtk2";
  };

  home.sessionVariables = {
    GTK_THEME = "adw-gtk3-dark";
    QT_QPA_PLATFORMTHEME = "gtk2";
    QT_STYLE_OVERRIDE = "gtk2";
    ADW_DISABLE_PORTAL = "1";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = lib.mkForce "adw-gtk3-dark";
      icon-theme = lib.mkForce theme.iconTheme;
      cursor-theme = theme.cursorTheme;
      cursor-size = theme.cursorSize;
      font-name = "${theme.fontUi} 11";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = theme.cursorTheme;
    package = pkgs.phinger-cursors;
    size = theme.cursorSize;
  };

  xdg.configFile."gtk-3.0/gtk.css".text = ''
    @define-color theme_base_color #${c.bg0};
    @define-color theme_bg_color #${c.bg1};
    @define-color theme_fg_color #${c.fg0};
    @define-color theme_selected_bg_color #${c.accentBlue};
    @define-color theme_selected_fg_color #${c.bg0};
    @define-color borders #${c.bg3};
    @define-color unfocused_borders #${c.bg2};
    @define-color warning_color #${c.accentPeach};
    @define-color error_color #${c.danger};
    @define-color success_color #${c.accentGreen};
  '';

  xdg.configFile."gtk-4.0/gtk.css".text = ''
    @define-color theme_base_color #${c.bg0};
    @define-color theme_bg_color #${c.bg1};
    @define-color theme_fg_color #${c.fg0};
    @define-color theme_selected_bg_color #${c.accentBlue};
    @define-color theme_selected_fg_color #${c.bg0};
    @define-color borders #${c.bg3};
    @define-color unfocused_borders #${c.bg2};
    @define-color warning_color #${c.accentPeach};
    @define-color error_color #${c.danger};
    @define-color success_color #${c.accentGreen};
  '';

  home.packages = with pkgs; [
    adw-gtk3
    papirus-icon-theme
    phinger-cursors
    lxappearance
  ];
}
