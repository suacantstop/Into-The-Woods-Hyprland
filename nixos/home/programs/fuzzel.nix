{ pkgs, ... }:
let
  theme = import ./palette.nix;
  c = theme.colors;
in {
  home.packages = with pkgs; [
    fuzzel
  ];

  xdg.configFile."fuzzel/fuzzel.ini".text = ''
    [main]
    terminal=foot
    font=${theme.fontMono}:size=12
    prompt="> "
    placeholder=forage...
    icon-theme=${theme.iconTheme}
    icons-enabled=yes
    width=34
    lines=9
    horizontal-pad=20
    vertical-pad=14
    inner-pad=12
    layer=overlay
    anchor=center
    dpi-aware=yes

    [colors]
    background=${c.bg0}eb
    text=${c.fg0}ff
    prompt=${c.accentBlue}ff
    placeholder=${c.fg1}cc
    input=${c.fg0}ff
    match=${c.accentViolet}ff
    selection=${c.bg2}ff
    selection-text=${c.fg0}ff
    selection-match=${c.accentCyan}ff
    border=${c.accentBlue}ff

    [border]
    width=2
    radius=14
    selection-radius=12
  '';
}
