# 🇮🇹 NALA-Strata-RS (`v0.2.15-nala.6.6.6`) — Manuale Italiano

**Motore di Offloading MoE a 3 Livelli (`VRAM + RAM di Sistema + NVMe mmap`), Sblocco Universale `llama.cpp` GGUF & Doctor Hardware PCIe/NUMA 100 % Rust Nativo (`Edition 2024`, Zero-Python)**

---

## 1. Novità in `v0.2.15-nala.6.6.6` (`OPT-STRATA-01` .. `OPT-STRATA-08`)
- **`OPT-STRATA-01` — Sblocco Universale `llama-server` (`--load-mode mmap`) & GGUF Locali:** Riabilita l'avvio diretto di modelli `.gguf` locali tramite `llama.cpp` bloccato in `Strata v0.2.15`.
- **`OPT-STRATA-02` — Sincronizzazione `v0.2.15` + `GLM-5.3-Flash`, `Qwen3.6-35B-A3B` & `Qwen4`:** Include il fix `--drafting off` (risparmia `5.2 GB` di download MTP, avvio in `13s` invece di `272s`, 100 % offline).
- **`OPT-STRATA-03` — Recupero Arena RAM fino a `-21.7 GiB` (`#3185`).**
- **`OPT-STRATA-04` — Sblocco Intel Arc `7.06 GiB` (`+78 %`, `#5578`) + Boost Turing/Volta (`sm_61..75`) & Cache PTX-JIT `2 GiB` (`#5784`).**
- **`OPT-STRATA-05` — Supporto GPU da `4.0 GB` VRAM & WDDM Low-Latency (`#2522`).**
- **`OPT-STRATA-06` — Conversazioni Parcheggiate su NVMe (`#1937`).**
- **`OPT-STRATA-07` — Diagnostica PCIe, NUMA, `memlock` & Watt (`nala-strata-rs doctor`).**

## 2. Comandi Rapidi
```bash
nala-strata-rs --lang it --plan --gguf model.gguf --drafting off --json
nala-strata-rs doctor
nala-strata-rs --bench
```
