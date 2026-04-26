{ ... }:
let
  theme = import ./palette.nix;
  c = theme.colors;
in {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    settings = {
      "$mainMod" = "MOD3";
      "$browser" = "firefox";
      "$terminal" = "foot";
      "$launcher" = "fuzzel";

      monitor = [ "eDP-1, 1920x1080@144, 0x0, 1" ];
      workspace = [ "1, monitor:eDP-1, default:true" ];

      env = [
        "XCURSOR_THEME, ${theme.cursorTheme}"
        "XCURSOR_SIZE, ${toString theme.cursorSize}"
      ];

      "exec-once" = [
        "python3 /home/nixos/zapret-discord-youtube-linux/start_zapret.py"
        "swww-daemon & waybar"
        "swww img ~/Wallpaper/5.* --transition-type grow --transition-duration 0.9"
      ];

      general = {
        gaps_in = 6;
        gaps_out = 14;
        border_size = 2;
        layout = "dwindle";
        resize_on_border = true;

        "col.active_border" = "rgba(${c.accentBlue}ee) rgba(${c.accentViolet}ee) 40deg";
        "col.inactive_border" = "rgba(${c.bg3}aa)";
      };

      decoration = {
        rounding = 14;
        active_opacity = 0.96;
        inactive_opacity = 0.90;

        shadow = {
          enabled = true;
          range = 24;
          render_power = 3;
          color = "rgba(${c.bg0}cc)";
        };

        blur = {
          enabled = true;
          size = 8;
          passes = 2;
          new_optimizations = true;
          ignore_opacity = true;
          xray = false;
        };
      };

      layerrule = [
        "blur, waybar"
        "ignorezero, waybar"
        "blur, fuzzel"
        "ignorezero, fuzzel"
        "blur, notifications"
        "ignorealpha 0.7, notifications"
      ];

      animations = {
        enabled = true;
        bezier = [
          "softOut, 0.25, 0.9, 0.3, 1.0"
          "softIn, 0.16, 1.0, 0.3, 1.0"
        ];
        animation = [
          "windows, 1, 5, softOut, slide"
          "windowsOut, 1, 4, softIn, slide"
          "workspaces, 1, 5, softOut, slide"
          "fade, 1, 4, softIn"
        ];
      };

      input = {
        kb_layout = "us,ru";
        kb_options = "caps:hyper";
        follow_mouse = 1;
        accel_profile = "flat";
      };

      bind = [
        "$mainMod, SPACE, exec, hyprctl switchxkblayout all next"
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod, Q, killactive"
        "$mainMod, F, fullscreen"
        "$mainMod, R, exec, $launcher"
        "$mainMod, W, exec, $browser"
        "$mainMod, S, exec, $terminal -e yazi"
        "$mainMod, D, exec, telegram-desktop"
        "$mainMod, G, togglefloating"
        "$mainMod, E, exec, $terminal"

        "$mainMod, P, exec, hyprshot -m output -o ~/Pictures/Screenshots"
        "$mainMod SHIFT, P, exec, hyprshot -m region -o ~/Pictures/Screenshots"

        "SUPER ALT SHIFT, S, exec, systemctl suspend"
        "SUPER ALT SHIFT, Q, exec, poweroff"
        "SUPER ALT SHIFT, R, exec, reboot"
        "$mainMod CTRL, Q, exit"

        "CTRL SHIFT, 1, exec, swww img ~/Wallpaper/1.* --transition-type grow --transition-duration 0.7"
        "CTRL SHIFT, 2, exec, swww img ~/Wallpaper/2.* --transition-type grow --transition-duration 0.7"
        "CTRL SHIFT, 3, exec, swww img ~/Wallpaper/3.* --transition-type grow --transition-duration 0.7"
        "CTRL SHIFT, 4, exec, swww img ~/Wallpaper/4.* --transition-type grow --transition-duration 0.7"
        "CTRL SHIFT, 5, exec, swww img ~/Wallpaper/5.* --transition-type grow --transition-duration 0.7"
        "CTRL SHIFT, 6, exec, swww img ~/Wallpaper/6.* --transition-type grow --transition-duration 0.7"

        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, l, movewindow, r"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, j, movewindow, d"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      binde = [
        "$mainMod CTRL, h, resizeactive, -50 0"
        "$mainMod CTRL, l, resizeactive, 50 0"
        "$mainMod CTRL, k, resizeactive, 0 -50"
        "$mainMod CTRL, j, resizeactive, 0 50"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
