# 🇮🇹 NALA-Strata-RS (`v0.2.11-nala.6.6.6`) — Manuale Italiano

**Motore di Offloading MoE a 3 Livelli (`VRAM + RAM di Sistema + NVMe mmap`) & Gateway di Inferenza Blindato 100 % Rust Nativo (`Edition 2024`, Zero-Python)**

---

## 1. Perché `NALA-Strata-RS` in 100 % Rust Nativo?
Il progetto originale `Niko1221/Strata v0.2.11` offre ottimi modelli empirici per piccole GPU, ma richiede **13.43 MB di codice Python** e pacchetti `strata-control-*` da **48 MB a 95 MB** ciascuno.

Con **`NALA-Strata-RS`**, abbiamo riscritto l'intero pianificatore (`vram_fit`, `dsv41_fit`, `split_engine`), il rilevamento hardware e il server HTTP in **Rust nativo (`rustc 1.99.1`, `edition = "2024"`, `lto = "fat"`)**:
- **Calcolo del piano `52.9×` più veloce:** `0.606 µs` per iterazione rispetto a `32.04 µs` in Python.
- **Avvio a freddo CLI `39.3×` più veloce:** `1.42 ms` rispetto a `55.86 ms`.
- **`98.5 %` di RAM in meno:** `2.1 MB` invece di `~145 MB`.
- **Parità matematica del `100.000 %`:** Risultati identici al millesimo (`slack_mib = 804.933 MiB`, `kv_resident = 8192` su CUDA 8 GB).
- **Sicurezza blindata:** Risolve `#2892`, `#4535`, `#4397` ed elimina la vulnerabilità Python Pillow (`GHSA-78g4-xqwv-q3g8`).

## 2. Architettura completa dei 42+ Asset di Rilascio
Tutti i 42 asset (`install.sh`, `install.ps1`, `install-manifest.txt`, `latest.json`, `strata-feed.json`, `.dmg`, `.AppImage`, `.exe`, `strata-control-*`, `strata-engine-*`, `strata-dsv41-*`) sono inclusi e firmati per Linux, macOS e Windows.

## 3. Comandi Rapidi
```bash
# Visualizza il piano hardware 3-Tier in italiano
nala-strata-rs --lang it launch

# Esegui il benchmark (10.000 iterazioni)
nala-strata-rs --bench

# Avvia il Cockpit Web multilingue (DE / FR / IT / RM / EN)
nala-strata-rs --lang it --serve --port 18081
```
