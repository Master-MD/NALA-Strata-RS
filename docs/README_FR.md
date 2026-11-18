# 🇫🇷 NALA-Strata-RS (`v0.2.15-nala.6.6.6`) — Manuel Français

**Moteur d'Offloading MoE 3-Tiers (`VRAM + RAM Système + NVMe mmap`), Débloqueur Universel `llama.cpp` GGUF & Docteur Matériel PCIe/NUMA 100 % Rust Natif (`Edition 2024`, Zéro-Python)**

---

## 1. Nouveautés de `v0.2.15-nala.6.6.6` (`OPT-STRATA-01` à `OPT-STRATA-08`)
- **`OPT-STRATA-01` — Débloqueur Universel `llama-server` (`--load-mode mmap`) & GGUF Local :** Alors que `Strata v0.2.15` bloque `llama-server`, `nala-strata-rs` génère et lance automatiquement la commande optimale 3-Tiers sans OOM.
- **`OPT-STRATA-02` — Synchronisation `v0.2.15` + `GLM-5.3-Flash`, `Qwen3.6-35B-A3B` & `Qwen4` :** Inclut le correctif `--drafting off` (économise `5.2 Go` de téléchargement MTP, démarrage en `13s` au lieu de `272s`, 100 % hors-ligne).
- **`OPT-STRATA-03` — Récupération de `-21.7 Gio` d'Arène RAM (`#3185`).**
- **`OPT-STRATA-04` — Débloqueur Intel Arc `7.06 Gio` (`+78 %`, `#5578`) + Optimisation Turing/Volta (`sm_61..75`) & Cache PTX-JIT `2 Gio` (`#5784`).**
- **`OPT-STRATA-05` — Mode `4.0 Go` VRAM Portable & WDDM (`#2522`).**
- **`OPT-STRATA-06` — Conversations Parquées sur Disque NVMe (`#1937`).**
- **`OPT-STRATA-07` — Docteur PCIe, NUMA, `memlock` & Watts (`nala-strata-rs doctor`).**

## 2. Commandes Rapides
```bash
nala-strata-rs --lang fr --plan --gguf model.gguf --drafting off --json
nala-strata-rs doctor
nala-strata-rs --bench
```
