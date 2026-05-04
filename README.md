# Modern Clock for GNOME

A GNOME Shell extension that brings the [KDE Modern Clock](https://github.com/Prayag2/kde_modernclock) widget to GNOME desktops. Pixel-perfect port with the same fonts (Anurati + Poppins), sizes, and styling.

Inspired by Rainmeter skin "Mond" and [Prayag2's kde_modernclock](https://github.com/Prayag2/kde_modernclock).

## Features

- **Exact KDE Modern Clock design** — same Anurati font for day, Poppins for date/time
- **GNOME 46–54 support** — compatible with modern GNOME versions including GNOME 50+
- **Dynamic scaling** — automatically adjusts size based on your monitor resolution
- **Auto font installation** — bundled Anurati & Poppins fonts install automatically on first run
- **Desktop widget** — renders below windows, on the desktop background
- **No dependencies** — pure GNOME Shell extension, no Python, no Conky, no external tools
- **Wayland & X11** — works on both display servers

## Screenshots

```
          S U N D A Y
           01 MAY 2022
          - 08:22 PM -
```

## Installation

### Option 1: Quick install from archive

Download the latest release archive and run:

```bash
# Extract
tar -xzf modern-clock-gnome.tar.gz
cd modern-clock-gnome

# Install

# Logout and login for changes to take effect
```

### Option 2: Install from source

```bash
# Clone the repo
git clone https://github.com/YOUR_USERNAME/modern-clock-gnome.git
cd modern-clock-gnome

# Build and install
make install

# Logout and login for changes to take effect
```

### Option 3: Manual install

```bash
# Clone the repo
git clone https://github.com/YOUR_USERNAME/modern-clock-gnome.git
cd modern-clock-gnome

# Copy extension files
mkdir -p ~/.local/share/gnome-shell/extensions/modernclock@gnome-port
cp -r src/* ~/.local/share/gnome-shell/extensions/modernclock@gnome-port/

# Install fonts
mkdir -p ~/.local/share/fonts/modernclock
cp src/fonts/*.otf src/fonts/*.ttf ~/.local/share/fonts/modernclock/
fc-cache -f

# Enable
gnome-extensions enable modernclock@gnome-port

# Logout and login
```

> **Note:** On Wayland sessions you must logout and login after installation.
> On X11 you can restart GNOME Shell with Alt+F2 → `r` → Enter.

## Building a release archive

```bash
make dist
```

This creates `dist/modernclock@gnome-port.zip` ready for distribution.

## Configuration

Edit `src/extension.js` (or `~/.local/share/gnome-shell/extensions/modernclock@gnome-port/extension.js` after install) and change the constants at the top:

```javascript
const POSITION  = 'center';      // center | top-right | top-left | bottom-right | bottom-left
const MARGIN_X  = 60;            // horizontal margin (for non-center positions)
const MARGIN_Y  = 80;            // vertical margin (for non-center positions)
const USE_24H   = false;         // true = 24h format, false = 12h AM/PM
const TIME_CHAR = '-';           // character around time: "- 08:22 PM -"
```

### Scaling

The widget automatically scales based on monitor height. Base size is designed for 1080p:

| Monitor | Day font | Date/Time font |
|---------|----------|----------------|
| 768p    | 61px     | 16px           |
| 1080p   | 86px     | 23px           |
| 1440p   | 115px    | 31px           |
| 2160p   | 172px    | 46px           |

To adjust base sizes, edit `BASE_DAY_SIZE` and `BASE_SUB_SIZE` in `extension.js`.

## Uninstallation

```bash
# Using make
make uninstall

# Or manually
gnome-extensions disable modernclock@gnome-port
rm -rf ~/.local/share/gnome-shell/extensions/modernclock@gnome-port

# Remove fonts (optional)
rm -rf ~/.local/share/fonts/modernclock
fc-cache -f
```

## Troubleshooting

### Widget not visible after install
Make sure you logged out and back in (required on Wayland).

### Wrong font (no Anurati)
Check if fonts are installed:
```bash
fc-list | grep -i anurati
```
If not found, install manually:
```bash
mkdir -p ~/.local/share/fonts/modernclock
cp src/fonts/* ~/.local/share/fonts/modernclock/
fc-cache -f
```
Then logout/login again.

### Check extension status
```bash
gnome-extensions info modernclock@gnome-port
```

### View logs
```bash
journalctl --user -b 0 | grep -i ModernClock
```

### Text truncated with "..."
This should be fixed in the current version. If it happens, check that no other extension is interfering with St.Label rendering.

## Project structure

```
modern-clock-gnome/
├── src/
│   ├── extension.js        # Main extension code
│   ├── metadata.json        # Extension metadata
│   ├── stylesheet.css       # CSS styles (fallback)
│   └── fonts/
│       ├── Anurati.otf      # Day of week font
│       └── Poppins.ttf      # Date and time font
├── dist/                    # Built archives (after make dist)
├── Makefile                 # Build system
├── LICENSE                  # GPL-3.0
└── README.md
```

## Known limitations

- Widget is not visible during workspace switch animation (GNOME Shell limitation on Wayland — the background layer is hidden during transitions)
- Widget is not visible in Activities overview (same reason — it's part of the background layer)

## Credits

- Original widget: [Prayag2/kde_modernclock](https://github.com/Prayag2/kde_modernclock) (GPL-3.0)
- Design inspired by: Rainmeter skin "Mond"
- Fonts: Anurati (SIL OFL), Poppins (SIL OFL / Apache 2.0)

## License

GPL-3.0 — same as the original KDE Modern Clock.
