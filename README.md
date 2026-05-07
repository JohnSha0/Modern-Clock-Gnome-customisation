# Modern Clock for GNOME

GNOME Shell extension — порт [KDE Modern Clock](https://github.com/Prayag2/kde_modernclock) для GNOME. Те же шрифты (Anurati + Poppins), тот же дизайн.

## Возможности

- Точный дизайн KDE Modern Clock (шрифт Anurati, стиль Mond)
- GNOME 46–54 (включая GNOME 50+)
- Автоматическое масштабирование под разрешение монитора
- Автоустановка шрифтов при первом запуске
- Виджет на рабочем столе, под всеми окнами
- Wayland и X11

## Установка

### Способ 1: Из архива

Скачай `modernclock@gnome-port.zip` из [Releases](https://github.com/Tony-Rain/modern-clock-gnome/releases).

```bash
mkdir -p ~/.local/share/gnome-shell/extensions/modernclock@gnome-port
unzip modernclock@gnome-port.zip -d ~/.local/share/gnome-shell/extensions/modernclock@gnome-port/
gnome-extensions enable modernclock@gnome-port
```

Перелогинься чтобы расширение заработало.

> Шрифты Anurati и Poppins установятся автоматически при первом запуске расширения.

### Способ 2: Из исходников

```bash
git clone https://github.com/Tony-Rain/modern-clock-gnome.git
cd modern-clock-gnome
make install
```

Перелогинься чтобы расширение заработало.

> На Wayland обязательно logout/login. На X11 можно Alt+F2 → `r` → Enter.

## Настройка

Отредактируй `~/.local/share/gnome-shell/extensions/modernclock@gnome-port/extension.js`, константы в начале файла:

```javascript
const POSITION  = 'center';      // center | top-right | top-left | bottom-right | bottom-left
const MARGIN_X  = 60;            // отступ по горизонтали
const MARGIN_Y  = 80;            // отступ по вертикали
const USE_24H   = false;         // true = 24ч, false = 12ч AM/PM
const TIME_CHAR = '-';           // символ вокруг времени
```

После изменений — перелогинься.

## Удаление

### Если устанавливал из архива (Способ 1) или нет папки репозитория

```bash
gnome-extensions disable modernclock@gnome-port
rm -rf ~/.local/share/gnome-shell/extensions/modernclock@gnome-port
```

### Если устанавливал из исходников (Способ 2)



```bash
cd modern-clock-gnome
make uninstall
```

> `make uninstall` работает только если у тебя есть клонированный репозиторий с Makefile.

### Удалить шрифты (необязательно)

```bash
rm -rf ~/.local/share/fonts/modernclock
fc-cache -f
```

## Решение проблем

**Виджет не появился** — перелогинься (обязательно на Wayland).

**Неправильный шрифт** — проверь установку:
```bash
fc-list | grep -i anurati
```
Если пусто — установи вручную:
```bash
mkdir -p ~/.local/share/fonts/modernclock
cp ~/.local/share/gnome-shell/extensions/modernclock@gnome-port/fonts/* ~/.local/share/fonts/modernclock/
fc-cache -f
```

**Логи:**
```bash
journalctl --user -b 0 | grep -i ModernClock
```

## Известные ограничения

- Не виден во время анимации смены рабочих столов (ограничение GNOME Shell на Wayland)
- Не виден в обзоре Activities

## Благодарности

- Оригинал: [Prayag2/kde_modernclock](https://github.com/Prayag2/kde_modernclock) (GPL-3.0)
- Дизайн: Rainmeter скин "Mond"
- Шрифты: Anurati (SIL OFL), Poppins (SIL OFL / Apache 2.0)

## Лицензия

GPL-3.0
