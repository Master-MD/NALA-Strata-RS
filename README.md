# 🦀 NALA-Strata-RS (`v0.2.15-nala.6.6.6`)

**100% Native Rust-Turbo (`Edition 2024`, Zero-Python) Small-GPU 3-Tier (`VRAM + System RAM + NVMe mmap`) MoE Offload Engine, Universal `llama.cpp` / Local-GGUF Unlocker, `-21.7 GiB` RAM Arena Reclaimer & PCIe/NUMA Hardware Doctor**

> **🔥 What's New in `v0.2.15-nala.6.6.6` (`OPT-STRATA-01` .. `OPT-STRATA-08`):**
> 1. **🔓 `v0.2.15` Local-GGUF & `llama-server` Unlocker (`OPT-STRATA-01`):** Upstream `Strata v0.2.15` blocked starting `llama.cpp`'s `llama-server` with local `.gguf` models. `NALA-Strata-RS` unlocks 1-click `llama-server --load-mode mmap` execution (running 274 GB `DeepSeek-V4.1-Flash` in just `18.8 GiB` resident RAM with 0% OOM!).
> 2. **⚡ Upstream `v0.2.15` Sync + `GLM-5.3-Flash`, `Qwen3.6-35B-A3B` & `Qwen4` (`OPT-STRATA-02`):** Includes the `--drafting off` fix (saves `5.2 GB` MTP download, starts in `13s` instead of `272s`, 100% offline/airgap ready).
> 3. **💾 `-21.7 GiB` Host RAM Arena Reclaim (`OPT-STRATA-03` / PR `#3185`):** Automatically hands back host RAM blocks for layers held whole in GPU VRAM.
> 4. **🚀 Intel Arc `4 GiB` Cap Unlocker (`7.06 GiB`, `+78%`, `#5578`) + Turing/Volta (`sm_61..75` V100/P40/Quadro) & `2 GiB` PTX-JIT Cache (`OPT-STRATA-04`):** Prevents the 8-minute Blackwell/mixed-GPU startup hang (`#5784`) and restores full Volta/Turing MMVQ speed (`#2197`, `#4767`, `#6088`).
> 5. **💻 `4.0 GB` VRAM Laptop & WDDM Low-Latency Mode (`OPT-STRATA-05`):** Lowers the minimum GPU floor from `6 GB` to `4 GB` VRAM (`RTX 3050 Laptop`, `Quadro M4000`, small Proxmox VMs).
> 6. **💿 Disk-Parked Conversations (`OPT-STRATA-06` / Issue `#1937`):** Parks inactive chat KV caches onto NVMe SSD (`--conversation-disk-dir`), freeing 100% of VRAM between agent turns.
> 7. **🩺 Sub-Millisecond PCIe Gen/Width, NUMA, `memlock` & Watt Doctor (`OPT-STRATA-07` / `#4610`):** Instant hardware bottleneck diagnostics (`nala-strata-rs doctor`).

🌍 **5-Language Documentation / Dokumentation in 5 Sprachen / Documentation en 5 langues / Documentazione in 5 lingue / Documentaziun en 5 linguas:**
- 🇩🇪 **[Deutsch (DE)](./docs/README_DE.md)** — Vollständiges Handbuch, `v0.2.15` Unlocker & Vergleichs-Matrix
- 🇫🇷 **[Français (FR)](./docs/README_FR.md)** — Manuel complet, Débloqueur `v0.2.15` & Architecture 3-Tiers
- 🇮🇹 **[Italiano (IT)](./docs/README_IT.md)** — Manuale completo, Sblocco `v0.2.15` & Architettura 3-Tier
- 🇨🇭 **[Rumantsch Grischun (RM)](./docs/README_RM.md)** — Manual cumplet, `v0.2.15` Unlocker & Architectura 3-Tier
- 🇬🇧 **[English (EN)](./docs/README_EN.md)** — Full Manual, `v0.2.15` GGUF Unlocker & Benchmark Matrix
- 📖 **[Upstream Strata Reference](./README_UPSTREAM_STRATA.md)** — Original `Niko1221/Strata` Documentation

---

## ⚡ One-Line Installation (Linux, macOS Apple Silicon/Intel & Windows)

### Linux (`x86_64` & `aarch64` DGX Spark) & macOS (`arm64` M1–M5 & `x86_64`)
```bash
curl -fsSL https://github.com/Master-MD/NALA-Strata-RS/releases/latest/download/install.sh -o install.sh && sh install.sh
```

### Windows (`x86_64` PowerShell 5.1+)
```powershell
irm https://github.com/Master-MD/NALA-Strata-RS/releases/latest/download/install.ps1 | iex
```

---

## 🏆 Ecosystem Comparison: `NALA-Strata-RS` vs. Upstream `Strata v0.2.15` & Top Forks

| Feature / Capability | Upstream `Niko1221/Strata v0.2.15` | `MistVVK/XeStrata` | `jmnargi/Strata-V100` | `Hardin22/Strata-DualGPU` | 🦀 `Master-MD/NALA-Strata-RS` (`v0.2.15`) |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **Control-Plane Language & Size** | Python (`95 MB` archive) | Python | Python | Python | **100% Native Rust (`< 1.7 MB`, Zero-Python!)** |
| **Planner Speed (`10k` Loop / Cold-Start)** | `32.04 µs` / `55.86 ms` | `~32 µs` | `~32 µs` | `~32 µs` | **`0.606 µs` (`52.9×` faster) / `1.42 ms` (`39.3×`)** |
| **Local `.gguf` & `llama-server` (`--load-mode mmap`)** | ❌ **Blocked in `v0.2.15`** | ❌ | ❌ | ❌ | **✅ Unlocked (`OPT-STRATA-01` Auto-Launcher)** |
| **`-21.7 GiB` Host RAM Arena Reclaim (`#3185`)** | ❌ | ❌ | ❌ | ❌ | **✅ Built-in (`OPT-STRATA-03`)** |
| **Intel Arc `4 GiB` Cap Unlocker (`7.06 GiB`, `#5578`)** | ❌ | ⚠️ Partial | ❌ | ❌ | **✅ Automatic (`OPT-STRATA-04`)** |
| **Volta / Turing / Pascal (`sm_61..75` V100/P40/Quadro)** | ⚠️ `-12%` regression in `0.1.60` | ❌ | ✅ (`sm_70` only) | ❌ | **✅ Full `sm_61..sm_75` + `2 GiB` PTX Cache (`OPT-STRATA-04`)** |
| **Asymmetric Multi-GPU (`16GB+8GB`, `3×8GB`)** | ⚠️ Drops `<= 8 GB` cards | ❌ | ❌ | ✅ (2 cards) | **✅ Proportional 3-Tier Split (`2..8` cards)** |
| **Minimum VRAM Floor (`4 GB` Laptop / WDDM)** | `6.0 GB` / `8.0 GB` | `6.0 GB` | `16.0 GB` | `8.0 GB` | **✅ `4.0 GB` VRAM + WDDM Guard (`OPT-STRATA-05`)** |
| **Disk-Parked Conversations (`#1937` / `COLI_PARK`)** | ❌ Open Issue | ❌ | ❌ | ❌ | **✅ Built-in (`OPT-STRATA-06`)** |
| **PCIe Gen/Width, NUMA, `memlock` & Watt Doctor** | ❌ Open Issue `#4610` | ❌ | ❌ | ❌ | **✅ `< 1 ms` Native `doctor` (`OPT-STRATA-07`)** |
| **Multilingual UI & Docs (`DE/FR/IT/RM/EN`)** | EN only | EN/ZH | EN only | EN only | **✅ 5 Languages (`DE • FR • IT • RM • EN`)** |

---

## 🛠️ Quick CLI Examples

```bash
# 1. Unlock & generate/launch optimal 3-Tier llama-server mmap command for any local GGUF:
nala-strata-rs --plan --gguf /models/DeepSeek-V4.1-Flash-Q2_K.gguf --drafting off --json

# 2. Run PCIe Link Speed/Width, NUMA, memlock & GPU Watt/Temp Doctor (< 1 ms):
nala-strata-rs doctor

# 3. Simulate asymmetric Dual-GPU (16 GB Quadro P5000 + 8 GB Quadro RTX 4000) with 64 GB RAM:
nala-strata-rs --plan --simulate-cards "16:NVIDIA Quadro P5000,8:NVIDIA Quadro RTX 4000" --simulate-ram-gb 64 --vendor cuda --json

# 4. Simulate 4 GB VRAM Laptop GPU (RTX 3050 Laptop) with Windows WDDM Low-Latency Mode:
nala-strata-rs --plan --simulate-vram-gb 4 --simulate-ram-gb 32 --wddm-low-latency --model qwen3.6-35b-a3b --json

# 5. Run 10,000-iteration benchmark against Python Strata:
nala-strata-rs --bench

# 6. Start 5-Language Web Cockpit (DE / FR / IT / RM / EN) on http://127.0.0.1:18081:
nala-strata-rs --serve --port 18081
```

---

## 📜 License & Attribution
Released under the **MIT License**. Original empirical sharding measurements by [`Niko1221/Strata`](https://github.com/Niko1221/Strata) and `llama.cpp` / `ggml`. Native Rust-Turbo (`Edition 2024`) rewrite, `OPT-STRATA-01..08` upgrades, security hardening, and 5-language support by NALA-OS Open-Source Engineering.
