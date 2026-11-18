# 🇨🇭 NALA-Strata-RS (`v0.2.15-nala.6.6.6`) — Manual Rumantsch Grischun

**Motur d'Offloading MoE 3-Tier (`VRAM + RAM dal Sistem + NVMe mmap`), Universal `llama.cpp` GGUF Unlocker & Doctor da Hardware PCIe/NUMA 100 % Rust Nativ (`Edition 2024`, Zero-Python)**

---

## 1. Novaziuns en `v0.2.15-nala.6.6.6` (`OPT-STRATA-01` .. `OPT-STRATA-08`)
- **`OPT-STRATA-01` — Universal `llama-server` (`--load-mode mmap`) & Local-GGUF Unlocker:** Pussibilitescha d'aviar datotecas `.gguf` localas cun `llama.cpp` ch'èn vegnidas bloccadas en `Strata v0.2.15`.
- **`OPT-STRATA-02` — Sincronisaziun `v0.2.15` + `GLM-5.3-Flash`, `Qwen3.6-35B-A3B` & `Qwen4`:** Cuntegna il fix `--drafting off` (spargna `5.2 GB` download MTP, start en `13s` enstagl da `272s`, 100 % offline).
- **`OPT-STRATA-03` — `-21.7 GiB` Host-RAM Arena-Reclaim (`#3185`).**
- **`OPT-STRATA-04` — Intel Arc `7.06 GiB` Unlocker (`+78 %`, `#5578`) + Turing/Volta (`sm_61..75`) & `2 GiB` PTX-JIT Cache (`#5784`).**
- **`OPT-STRATA-05` — Modus per `4.0 GB` VRAM Laptops & WDDM (`#2522`).**
- **`OPT-STRATA-06` — Conversaziuns Parcadas sin NVMe (`#1937`).**
- **`OPT-STRATA-07` — Doctor per PCIe, NUMA, `memlock` & Watts (`nala-strata-rs doctor`).**

## 2. Cumonds Svelts
```bash
nala-strata-rs --lang rm --plan --gguf model.gguf --drafting off --json
nala-strata-rs doctor
nala-strata-rs --bench
```
