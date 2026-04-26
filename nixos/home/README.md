# Into the Woods Dotfiles

Конфигурация NixOS + Home Manager, подготовленная как конкурсный проект с единой авторской темой **Into the Woods**.

## Концепт

Into the Woods - это ночной лес, влажный мох и мягкий сумеречный свет:

- База: глубокие лесные тени и темно-оливковые поверхности.
- Акценты: мшисто-зеленый, шалфейный и древесно-янтарный.
- Сигнальные цвета: кора (warning) и приглушенный терракотовый (danger).

Готовые схемы типа Nord/Everforest не использованы как основа палитры.

## Палитра

Основные цвета заданы в [home/programs/palette.nix](/etc/nixos/home/programs/palette.nix):

- `#0f1711` - base background
- `#16231a` - elevated background
- `#223229` - selection background
- `#31493b` - border / hover background
- `#e7f2e8` - primary foreground
- `#b8c8b6` - secondary foreground
- `#6ea06a` - primary accent
- `#9ec79a` - secondary accent
- `#b5965a` - tertiary accent
- `#c77a4e` - warning
- `#87b980` - success
- `#d56c5b` - danger

## Что настроено

Полностью переработаны все модули в `home/programs`:

- Hyprland, Waybar, Foot, Fuzzel, Kitty, Alacritty
- Fish, Fastfetch
- GTK/Qt theme layer
- NVF (Neovim), Firefox, Git, Rofi

Тема сквозная: шрифты, цвета, иконки, терминалы, панель, лаунчер, WM и редактор.

## Скриншоты

Папка со скриншотами: [home/contest/screenshots](/etc/nixos/home/contest/screenshots)

![Wallpaper base](contest/screenshots/01-wallpaper-base.png)
![Workspace preview](contest/screenshots/02-workspace-preview.jpg)
![Terminal preview](contest/screenshots/03-terminal-preview.png)

## Приложенные файлы

- [palette.json](contest/attachments/palette.json)
- [contest-checklist.md](contest/attachments/contest-checklist.md)
- [capture-showcase.sh](contest/scripts/capture-showcase.sh)

## Применение

```bash
sudo nixos-rebuild switch --flake /etc/nixos#nixos
```

## Нюанс по скриншотам

В репозиторий добавлены превью-изображения для структуры submission.
Актуальные скриншоты рабочего стола можно снять скриптом:

```bash
bash /etc/nixos/home/contest/scripts/capture-showcase.sh
```
