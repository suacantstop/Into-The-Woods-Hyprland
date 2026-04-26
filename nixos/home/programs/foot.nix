{ pkgs, ... }:
let
  theme = import ./palette.nix;
  c = theme.colors;
in {
  home.packages = with pkgs; [
    foot
  ];

  xdg.configFile."foot/foot.ini".text = ''
    [main]
    term=xterm-256color
    font=${theme.fontMono}:size=8
    shell=${pkgs.fish}/bin/fish
    pad=15x15
    dpi-aware=yes

    [scrollback]
    lines=25000

    [cursor]
    style=beam
    blink=yes

    [colors]
    alpha=0.92
    background=${c.bg0}
    foreground=${c.fg0}
    regular0=${c.bg1}
    regular1=${c.danger}
    regular2=${c.accentGreen}
    regular3=${c.accentPeach}
    regular4=${c.accentBlue}
    regular5=${c.accentViolet}
    regular6=${c.accentCyan}
    regular7=${c.fg1}
    bright0=${c.bg3}
    bright1=${c.danger}
    bright2=${c.accentGreen}
    bright3=${c.accentPeach}
    bright4=${c.accentBlue}
    bright5=${c.accentViolet}
    bright6=${c.accentCyan}
    bright7=${c.fg0}
    selection-foreground=${c.fg0}
    selection-background=${c.bg3}
    urls=${c.accentBlue}
  '';
}
