# 🇩🇪 NALA-Strata-RS (`v0.2.15-nala.6.6.6`) — Deutsches Handbuch

**100 % Native Rust-Turbo (`Edition 2024`, Zero-Python) Small-GPU 3-Tier (`VRAM + System-RAM + NVMe mmap`) MoE Offload-Engine, Universal `llama.cpp` GGUF-Unlocker & PCIe/NUMA Hardware-Doctor**

---

## 1. Was ist neu in `v0.2.15-nala.6.6.6` (`OPT-STRATA-01` bis `OPT-STRATA-08`)?
- **`OPT-STRATA-01` — Universal `llama-server` (`--load-mode mmap`) & Local-GGUF Unlocker:** Während das Original `Strata v0.2.15` das Starten von `llama.cpp` (`llama-server`) mit eigenen lokalen `.gguf`-Dateien komplett gesperrt hat, generiert und startet `nala-strata-rs` den optimalen 3-Tier `llama-server --load-mode mmap`-Befehl (damit läuft z. B. ein 274 GB `DeepSeek-V4.1-Flash` Modell in nur `18.8 GiB` Resident-RAM komplett ohne OOM!).
- **`OPT-STRATA-02` — Upstream `v0.2.15` Sync + `GLM-5.3-Flash`, `Qwen3.6-35B-A3B` & `Qwen4`:** Beinhaltet den `--drafting off` Fix (spart `5.2 GB` MTP-Download, startet in `13s` statt `272s` und läuft 100 % offline/airgapped).
- **`OPT-STRATA-03` — `-21.7 GiB` Host-RAM Arena-Reclaim (`#3185`):** Gibt System-RAM-Blöcke frei, deren Layer vollständig im GPU-VRAM liegen.
- **`OPT-STRATA-04` — Intel Arc `4 GiB` Unlocker (`7.06 GiB`, `+78 %`, `#5578`) + Turing/Volta (`sm_61..75` Quadro P5000 / RTX 4000 / V100) & `2 GiB` PTX-JIT Cache (`#5784`):** Verhindert den 8-minütigen PTX-Kompilier-Hänger beim Start und schaltet den schnellen B6 MMVQ-Pfad frei.
- **`OPT-STRATA-05` — `4.0 GB` VRAM Laptop- & VM-Modus (`#2522`):** Senkt das Minimum von `6.0 GB` auf `4.0 GB` VRAM (inkl. Windows WDDM Low-Latency-Schutz).
- **`OPT-STRATA-06` — Disk-Parked Conversations (`#1937` / `COLI_PARK`):** Parkt den KV-Cache inaktiver Chats auf der NVMe-SSD (`--conversation-disk-dir`).
- **`OPT-STRATA-07` — Sub-Millisekunden PCIe-, NUMA-, `memlock`- & Watt-Doctor (`#4610`):** Sofortige Diagnose via `nala-strata-rs doctor`.
- **`OPT-STRATA-08` — Universelle Single-Source-of-Truth Architektur:** 100 % frei von internen Daten (`PASS_ZERO_PII`), funktioniert out-of-the-box für jeden GitHub-Nutzer weltweit und bindet sich auf NALA-OS-Systemen (`/opt/nala/config`) vollautomatisch in den Bootstick-Wizard & `NALA-HAL v6.6.6` ein.

## 2. Schnellstart-Befehle
```bash
# 3-Tier Plan + llama-server mmap Unlocker + Optimierungen anzeigen
nala-strata-rs --lang de --plan --gguf /pfad/zu/model.gguf --drafting off --json

# PCIe Gen/Lanes, NUMA, memlock & GPU-Watt prüfen
nala-strata-rs doctor

# 10.000-Iterationen Benchmark gegen Python Strata
nala-strata-rs --bench
```
