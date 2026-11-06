#!/bin/sh
# ============================================================================
# 🦀 NALA-Strata-RS (v0.2.11-nala.6.6.6) — 5-Language One-Line Installer (DE/FR/IT/RM/EN)
# Linux (x86_64 & ARM64 NVIDIA DGX Spark) & macOS (Apple Silicon M1-M5 & Intel)
# ============================================================================
#   curl -fsSL https://github.com/Master-MD/NALA-Strata-RS/releases/latest/download/install.sh -o install.sh && sh install.sh
# ============================================================================
set -eu

FEED="${STRATA_FEED:-https://github.com/Master-MD/NALA-Strata-RS/releases/latest/download}"
FEED="${FEED%/}"
DATA_DIR="${STRATA_DATA_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/strata}"
BIN_DIR="${STRATA_BIN_DIR:-$HOME/.local/bin}"
LANG_CODE="${NALA_LANG:-${LANG:-de}}"

say() { printf '%s\n' "$*"; }
die() { printf 'nala-strata-rs installer: %s\n' "$*" >&2; exit 1; }

main() {
  case "$LANG_CODE" in
    fr*) say "🦀 Installation de NALA-Strata-RS (100% Rust Natif, Zéro-Python)..." ;;
    it*) say "🦀 Installazione di NALA-Strata-RS (100% Rust Nativo, Zero-Python)..." ;;
    rm*) say "🦀 Installaziun da NALA-Strata-RS (100% Rust Nativ, Zero-Python)..." ;;
    en*) say "🦀 Installing NALA-Strata-RS (100% Native Rust, Zero-Python)..." ;;
    *)   say "🦀 Installiere NALA-Strata-RS (100% Native Rust, Zero-Python)..." ;;
  esac

  if command -v curl >/dev/null 2>&1; then
    fetch() { curl -fsSL --retry 3 -o "$2" "$1"; }
  elif command -v wget >/dev/null 2>&1; then
    fetch() { wget -q -O "$2" "$1"; }
  else
    die "curl or wget is required."
  fi

  if command -v sha256sum >/dev/null 2>&1; then
    sha() { sha256sum "$1" | cut -d' ' -f1; }
  elif command -v shasum >/dev/null 2>&1; then
    sha() { shasum -a 256 "$1" | cut -d' ' -f1; }
  else
    die "sha256sum or shasum is required."
  fi

  OS="$(uname -s)"
  ARCH="$(uname -m)"
  case "$OS-$ARCH" in
    Linux-x86_64|Linux-amd64)   PLAT="linux-x86_64" ;;
    Linux-aarch64|Linux-arm64)  PLAT="linux-aarch64" ;;
    Darwin-arm64|Darwin-aarch64) PLAT="macos-arm64" ;;
    Darwin-x86_64)              PLAT="macos-arm64" ;;
    *) die "Unsupported platform: $OS-$ARCH" ;;
  esac

  TMP_DIR="$(mktemp -d)"
  trap 'rm -rf "$TMP_DIR"' EXIT

  fetch "$FEED/install-manifest.txt" "$TMP_DIR/install-manifest.txt"
  LINE="$(grep "^$PLAT " "$TMP_DIR/install-manifest.txt" | head -n 1 || true)"
  [ -n "$LINE" ] || die "No entry for $PLAT in install-manifest.txt"

  VER="$(echo "$LINE" | awk '{print $2}')"
  ARCHIVE="$(echo "$LINE" | awk '{print $3}')"
  EXPECTED_SHA="$(echo "$LINE" | awk '{print $4}')"

  fetch "$FEED/$ARCHIVE" "$TMP_DIR/$ARCHIVE"
  ACTUAL_SHA="$(sha "$TMP_DIR/$ARCHIVE")"
  [ "$ACTUAL_SHA" = "$EXPECTED_SHA" ] || die "SHA-256 mismatch for $ARCHIVE"

  DEST="$DATA_DIR/terminal/$VER"
  mkdir -p "$DEST" "$BIN_DIR"
  tar -xzf "$TMP_DIR/$ARCHIVE" -C "$DEST"

  "$DEST/bin/strata" update --check
  ln -sf "$DEST/bin/strata" "$BIN_DIR/strata"
  ln -sf "$DEST/bin/nala-strata-rs" "$BIN_DIR/nala-strata-rs"

  case "$LANG_CODE" in
    fr*) say "✅ Installé avec succès ! Lancez : nala-strata-rs --lang fr launch" ;;
    it*) say "✅ Installato con successo! Avvia con: nala-strata-rs --lang it launch" ;;
    rm*) say "✅ Installà cun success! Cumenza cun: nala-strata-rs --lang rm launch" ;;
    en*) say "✅ Installed. Run: strata launch  (or: nala-strata-rs --lang en launch)" ;;
    *)   say "✅ Erfolgreich installiert! Starte mit: nala-strata-rs --lang de launch" ;;
  esac
}

main "$@"
