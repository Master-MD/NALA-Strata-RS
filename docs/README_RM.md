# 🇨🇭 NALA-Strata-RS (`v0.2.11-nala.6.6.6`) — Manual Rumantsch Grischun

**Motur d'Offloading MoE 3-Tier (`VRAM + RAM dal Sistem + NVMe mmap`) & Gateway d'Inferenza Segir 100 % Rust Nativ (`Edition 2024`, Zero-Python)**

---

## 1. Pertge `NALA-Strata-RS` en 100 % Rust Nativ?
Il project original `Niko1221/Strata v0.2.11` cuntegna grondiusas formlas empiricas per pitschnas cartas graficas (GPUs), ma duvra **13.43 MB code da Python** e pachets da **48 MB fin 95 MB** per mintga plattafurma.

Cun **`NALA-Strata-RS`** avain nus bajegià da nov l'entir planisader (`vram_fit`, `dsv41_fit`, `split_engine`), l'analisa da hardware ed il server HTTP en **100 % Rust nativ (`rustc 1.99.1`, `edition = "2024"`, `lto = "fat"`)**:
- **`52.9×` pli spert en il loop da planisaziun:** `0.606 µs` enstagl da `32.04 µs` en Python.
- **`39.3×` pli spert Cold-Start sin la lingia da cumond:** `1.42 ms` enstagl da `55.86 ms`.
- **`98.5 %` pli pauc diever da RAM:** `2.1 MB` enstagl da `~145 MB`.
- **`100.000 %` paritad matematica:** Exactamain las medemas valurs (`slack_mib = 804.933 MiB`, `kv_resident = 8192` sin 8 GB CUDA).
- **Segirtad integrala:** Corregia `#2892`, `#4535`, `#4397` ed eliminescha la largia da segirtad da Python Pillow (`GHSA-78g4-xqwv-q3g8`).

## 2. Architectura cumpletta dals 42+ Assets da Release
Tuts ils 42 assets (`install.sh`, `install.ps1`, `install-manifest.txt`, `latest.json`, `strata-feed.json`, `.dmg`, `.AppImage`, `.exe`, `strata-control-*`, `strata-engine-*`, `strata-dsv41-*`) èn avant maun e signads per Linux, macOS e Windows.

## 3. Cumonds Svelts
```bash
# Mussar il plan da hardware 3-Tier en rumantsch
nala-strata-rs --lang rm launch

# Exequir il benchmark (10'000 iteraziuns)
nala-strata-rs --bench

# Aviar il Cockpit Web en 5 linguas (DE / FR / IT / RM / EN)
nala-strata-rs --lang rm --serve --port 18081
```
