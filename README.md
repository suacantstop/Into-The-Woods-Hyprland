# 🌲 Into the Woods // NixOS Contest Edition

<div align="center">
  <img src="https://raw.githubusercontent.com/ваше_имя/репозиторий/main/screenshots/main.jpg" width="100%" alt="Forest Rice Preview">
  <br />
  <p align="center">
    <img src="https://img.shields.io/badge/NixOS-unstable-blue?logo=nixos&logoColor=white&style=for-the-badge" />
    <img src="https://img.shields.io/badge/WM-Hyprland-white?logo=hyprland&logoColor=white&style=for-the-badge&color=33ccff" />
    <img src="https://img.shields.io/badge/Theme-Gruvbox_Forest-orange?style=for-the-badge" />
  </p>
</div>

---

## 🍃 О проекте
Этот райс был специально разработан для конкурса. Основная идея — **«Цифровой лес»**: сочетание строгой декларативности NixOS с теплым, органическим визуалом Gruvbox. Система полностью управляется через Nix Flakes и имеет единую палитру цветов для всех компонентов.

## 🛠 Технический стек
| Компонент | Выбор | Особенности |
| :--- | :--- | :--- |
| **Оболочка** | `Hyprland` | Динамический тайлинг, блюр и кастомные кривые анимаций. |
| **Терминалы** | `Foot` / `Alacritty` | Минимализм и высокая производительность. |
| **Шелл** | `Fish` | Умные функции, встроенный калькулятор (`= 2+2`) и алиасы. |
| **Редактор** | `NVF` (Neovim) | Полностью прозрачный интерфейс, Gruvbox-тема и LSP. |
| **Панель** | `Waybar` | Кастомные разделители и мониторинг ресурсов в реальном времени. |
| **Утилиты** | `Fastfetch` | Специальный "Contest Edition" вывод системной инфы. |

## ✨ Основные фишки
- 🌳 **Единая палитра:** Все цвета импортируются из одного файла `palette.nix`.
- ⚡ **Оптимизация:** Настройки под NVIDIA RTX 3070 Laptop для максимальной плавности.
- 🧪 **Zapret:** Интегрированный скрипт обхода замедлений для YouTube и Discord.
- 🌓 **Прозрачность:** Тщательно настроенный `background_opacity` (0.93) для эффекта глубины без потери читаемости.

## 📂 Структура репозитория
```text
.
├── hyprland.nix     # Логика окон, бинды и анимации
├── waybar.nix       # Оформление верхней панели (CSS + JSON)
├── nvf.nix          # Конфигурация Neovim на базе Nix
├── fastfetch.nix    # Тот самый конкурсный системный вывод
├── palette.nix      # Центральный узел управления цветами
└── devices/         # Специфичные настройки железа
