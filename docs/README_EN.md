# 🇬🇧 NALA-Strata-RS (`v0.2.15-nala.6.6.6`) — English Manual

**100% Native Rust-Turbo (`Edition 2024`, Zero-Python) Small-GPU 3-Tier (`VRAM + System RAM + NVMe mmap`) MoE Offload Engine, Universal `llama.cpp` Local-GGUF Unlocker & PCIe/NUMA Hardware Doctor**

---

## 1. What's New in `v0.2.15-nala.6.6.6` (`OPT-STRATA-01` .. `OPT-STRATA-08`)
- **`OPT-STRATA-01` — Universal `llama-server` (`--load-mode mmap`) & Local-GGUF Unlocker:** Restores and automates 1-click `llama.cpp` local `.gguf` execution that upstream `Strata v0.2.15` disabled.
- **`OPT-STRATA-02` — Upstream `v0.2.15` Sync + `GLM-5.3-Flash`, `Qwen3.6-35B-A3B` & `Qwen4`:** Includes the `--drafting off` fix (saves `5.2 GB` MTP download, starts in `13s` vs `272s`, 100% offline/airgap ready).
- **`OPT-STRATA-03` — `-21.7 GiB` Host RAM Arena Reclaim (`#3185`):** Reclaims host RAM blocks for layers held completely in GPU VRAM.
- **`OPT-STRATA-04` — Intel Arc `4 GiB` Cap Unlocker (`7.06 GiB`, `+78%`, `#5578`) + Turing/Volta (`sm_61..75` V100/P40/Quadro) & `2 GiB` PTX-JIT Cache (`#5784`).**
- **`OPT-STRATA-05` — `4.0 GB` VRAM Laptop & Windows WDDM Low-Latency Mode (`#2522`).**
- **`OPT-STRATA-06` — Disk-Parked Conversations (`#1937` / `COLI_PARK`):** Streams inactive KV caches to NVMe SSD (`--conversation-disk-dir`).
- **`OPT-STRATA-07` — Sub-Millisecond PCIe Gen/Width, NUMA, `memlock` & Watt Doctor (`nala-strata-rs doctor`, `#4610`).**

## 2. Quick Start Commands
```bash
nala-strata-rs --lang en --plan --gguf model.gguf --drafting off --json
nala-strata-rs doctor
nala-strata-rs --bench
```
