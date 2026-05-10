# Modern Clock for GNOME

> **[🇷🇺 Русская версия](README_RU.md)**

GNOME Shell extension — a port of [KDE Modern Clock](https://github.com/Prayag2/kde_modernclock) for GNOME. Same fonts (Anurati + Poppins), same design.

## Features

- Exact KDE Modern Clock design (Anurati font, Mond style)
- GNOME 46–50+
- Auto-scaling based on monitor resolution
- Auto font installation on first run
- Desktop widget, rendered below all windows
- Wayland & X11

## Installation

### Method 1: From archive

Download `modernclock@gnome-port.zip` from [Releases](https://github.com/Tony-Rain/modern-clock-gnome/releases).

```bash
mkdir -p ~/.local/share/gnome-shell/extensions/modernclock@gnome-port
unzip modernclock@gnome-port.zip -d ~/.local/share/gnome-shell/extensions/modernclock@gnome-port/
```

Log out and log back in so the system detects the new extension, then enable it:

```bash
gnome-extensions enable modernclock@gnome-port
```

Log out and log back in again for the extension to load.

> Anurati and Poppins fonts are installed automatically on first run.

### Method 2: From source

```bash
git clone https://github.com/Tony-Rain/modern-clock-gnome.git
cd modern-clock-gnome
make install
```

Log out and log back in for the extension to load.

> On Wayland you must log out/in. On X11 you can press Alt+F2 → `r` → Enter.

## Configuration

Edit `~/.local/share/gnome-shell/extensions/modernclock@gnome-port/extension.js`, constants at the top:

```javascript
const POSITION  = 'center';      // center | top-right | top-left | bottom-right | bottom-left
const MARGIN_X  = 60;            // horizontal margin
const MARGIN_Y  = 80;            // vertical margin
const USE_24H   = false;         // true = 24h, false = 12h AM/PM
const TIME_CHAR = '-';           // character around time
```

After editing — log out and log back in.

## Uninstallation

### Installed from archive (Method 1)

```bash
gnome-extensions disable modernclock@gnome-port
rm -rf ~/.local/share/gnome-shell/extensions/modernclock@gnome-port
```

### Installed from source (Method 2)

```bash
cd modern-clock-gnome
make uninstall
```

> `make uninstall` only works if you have the cloned repository with the Makefile.

### Remove fonts (optional)

```bash
rm -rf ~/.local/share/fonts/modernclock
fc-cache -f
```

## Troubleshooting

**Widget not visible** — make sure you logged out and back in (required on Wayland).

**Wrong font** — check if Anurati is installed:
```bash
fc-list | grep -i anurati
```
If not found, install manually:
```bash
mkdir -p ~/.local/share/fonts/modernclock
cp ~/.local/share/gnome-shell/extensions/modernclock@gnome-port/fonts/* ~/.local/share/fonts/modernclock/
fc-cache -f
```

**Logs:**
```bash
journalctl --user -b 0 | grep -i ModernClock
```

## Known limitations

- Not visible during workspace switch animation (GNOME Shell limitation on Wayland)
- Not visible in Activities overview

## Credits

- Original: [Prayag2/kde_modernclock](https://github.com/Prayag2/kde_modernclock) (GPL-3.0)
- Design: Rainmeter skin "Mond"
- Fonts: Anurati (SIL OFL), Poppins (SIL OFL / Apache 2.0)

## License

GPL-3.0
