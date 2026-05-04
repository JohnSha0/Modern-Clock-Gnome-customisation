#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────────────────────
#  Modern Clock for GNOME — быстрая установка из архива
# ─────────────────────────────────────────────────────────────────────────────
set -e

UUID="modernclock@gnome-port"
EXT_DIR="$HOME/.local/share/gnome-shell/extensions/$UUID"
FONT_DIR="$HOME/.local/share/fonts/modernclock"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "═══════════════════════════════════════════════"
echo "  Modern Clock for GNOME — установка"
echo "═══════════════════════════════════════════════"
echo ""

# Определить откуда брать файлы
if [ -d "$SCRIPT_DIR/src" ]; then
    SRC="$SCRIPT_DIR/src"
elif [ -f "$SCRIPT_DIR/extension.js" ]; then
    SRC="$SCRIPT_DIR"
else
    echo "✗ Не найдены файлы расширения"
    exit 1
fi

# Установить расширение
echo "▶ Установка расширения..."
rm -rf "$EXT_DIR"
mkdir -p "$EXT_DIR/fonts"
cp "$SRC/extension.js" "$EXT_DIR/"
cp "$SRC/metadata.json" "$EXT_DIR/"
cp "$SRC/stylesheet.css" "$EXT_DIR/"
cp "$SRC/fonts/Anurati.otf" "$EXT_DIR/fonts/"
cp "$SRC/fonts/Poppins.ttf" "$EXT_DIR/fonts/"
echo "  ✓ Расширение: $EXT_DIR"

# Установить шрифты
echo "▶ Установка шрифтов..."
mkdir -p "$FONT_DIR"
cp -f "$SRC/fonts/Anurati.otf" "$FONT_DIR/"
cp -f "$SRC/fonts/Poppins.ttf" "$FONT_DIR/"
fc-cache -f "$FONT_DIR" 2>/dev/null || true
echo "  ✓ Шрифты: $FONT_DIR"

# Активировать
echo "▶ Активация..."
gnome-extensions enable "$UUID" 2>/dev/null || true

echo ""
echo "═══════════════════════════════════════════════"
echo "  ✓ Установка завершена!"
echo ""
echo "  → Перелогинься чтобы расширение заработало"
echo ""
echo "  Управление:"
echo "    gnome-extensions enable  $UUID"
echo "    gnome-extensions disable $UUID"
echo ""
echo "  Удаление:"
echo "    make uninstall"
echo "    # или вручную:"
echo "    rm -rf $EXT_DIR"
echo "═══════════════════════════════════════════════"
