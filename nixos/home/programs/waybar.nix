let
  theme = import ./palette.nix;
  c = theme.colors;
in {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 34;
        margin-top = 8;
        margin-left = 12;
        margin-right = 12;
        spacing = 0;

        modules-left = [ "hyprland/workspaces" "hyprland/language" ];
        modules-center = [ "clock" ];
        modules-right = [ "network" "pulseaudio" "cpu" "memory" "temperature" "disk" "battery" "tray" "custom/power" ];

        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            "active" = "󰮯";
            "default" = "󰊠";
            "persistent" = "󰊠";
          };
          persistent-workspaces = { "*" = 5; };
        };

        "hyprland/language" = {
          format = "󰗊 {short}";
        };

        clock = {
          format = "󰃭  {:%H:%M}";
          tooltip-format = "<tt>{calendar}</tt>";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰝟";
          format-icons = { default = [ "󰕿" "󰖀" "󰕾" ]; };
          on-click = "pavucontrol";
        };

        network = {
          format-wifi = "󰤨 {signalStrength}%";
          format-disconnected = "󰤮";
        };

        cpu = { format = " {usage}%"; interval = 3; };
        memory = { format = "󰍛 {percentage}%"; interval = 3; };
        temperature = { format = " {temperatureC}°C"; critical-threshold = 80; };
        disk = { format = "󰋊 {percentage_used}%"; path = "/"; };

        battery = {
          states = { warning = 30; critical = 15; };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        };

        "custom/power" = {
          format = "";
          on-click = "systemctl poweroff";
        };
      };
    };

    style = ''
      * {
        border: none;
        font-family: "${theme.fontMono}", "JetBrainsMono Nerd Font";
        font-size: 13px;
        min-height: 0;
      }

      window#waybar {
        background: rgba(15, 17, 26, 0.4);
        border-radius: 20px;
        border: 1px solid rgba(255, 255, 255, 0.1);
      }

      #workspaces,
      #language,
      #clock,
      #pulseaudio,
      #network,
      #cpu,
      #memory,
      #temperature,
      #disk,
      #battery,
      #tray,
      #custom-power {
        background-color: rgba(20, 24, 35, 0.85);
        color: #${c.fg0};
        border-radius: 14px;
        padding: 0 12px;
        margin: 5px 4px;
        border: 1px solid rgba(255, 255, 255, 0.05);
      }

      /* Увеличиваем отступы у крайних элементов, чтобы они не наплывали на углы панели */
      .modules-left > widget:first-child > #workspaces { margin-left: 10px; }
      .modules-right > widget:last-child > #custom-power { margin-right: 10px; }

      #workspaces button {
        color: #${c.bg3};
        padding: 0 6px;
      }

      #workspaces button.active {
        color: #${c.accentGreen};
        text-shadow: 0 0 5px rgba(166, 227, 161, 0.5);
      }

      #clock { color: #${c.accentPeach}; font-weight: bold; }
      #pulseaudio { color: #${c.accentBlue}; }
      #network { color: #${c.accentCyan}; }
      #cpu { color: #${c.accentBlue}; }
      #memory { color: #${c.accentViolet}; }
      #temperature { color: #${c.accentPeach}; }
      #disk { color: #${c.fg1}; }
      #battery { color: #${c.accentGreen}; }
      #custom-power { color: #${c.danger}; }
    '';
  };
}
