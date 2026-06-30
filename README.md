# caelestia-nobara-dotfiles

Personal configuration layer for running the **[Caelestia](https://github.com/caelestia-dots)** Hyprland/Quickshell desktop on **Nobara 43** (Fedora-based), on a **Dell Precision 7560** laptop with **hybrid Intel iGPU + NVIDIA dGPU** graphics.

These are **my customizations only** — the GPU routing, per-monitor scaling, cursor-ghost fix, monitor layout, display-mode switching, power/sleep menu, and helper scripts I added on top of the shell. **This is not the Caelestia shell itself.**

> **Upstream credit.** The shell/CLI is installed from the frozen Fedora fork
> **[EnceladusII/caelestia-fedora](https://github.com/EnceladusII/caelestia-fedora)**
> (itself based on the upstream [caelestia-dots](https://github.com/caelestia-dots) project).
> All credit for the shell goes there. This repo only contains my own config overrides,
> scripts, and a couple of small edits to that fork's files (clearly isolated under
> [`caelestia-fork-changed-configs/`](caelestia-fork-changed-configs/) and credited below).

## What's here

```
config/                              # mirrors ~/.config/
  caelestia/hypr-user.conf           # the main override (sourced LAST by hyprland.conf, update-safe):
                                     #   - NVIDIA multi-GPU ghost-cursor fix (no_hardware_cursors=false)
                                     #   - per-monitor scale + position (eDP-1 @1.25, external-left)
                                     #   - display-mode keybinds (Super+Shift+1..4) + move-window-to-monitor (Super+Alt+Left/Right)
                                     #   - app shortcuts (Brave/Zed/OBS/Dolphin) + PWA/music special-workspace windowrules
  uwsm/env-hyprland                  # Hyprland session env + AQ_DRM_DEVICES GPU auto-routing block
  uwsm/env                           # shared session env (PATH fix for ~/.cargo/bin + ~/go/bin)
  plasma-workspace/env/gpu.sh        # KDE twin of the GPU auto-router (emits KWIN_DRM_DEVICES)
  foot/foot.ini                      # terminal: Ctrl+C/V copy-paste (Ctrl+C still sends SIGINT when nothing selected)

local-bin/                           # mirrors ~/.local/bin/  (put these on your PATH)
  display-mode                       # switch laptop / external / extend / mirror (hyprctl), black-screen-safe
  aq-gpu-mode                        # report the REAL render GPU under Hyprland (reads AQ_DRM_DEVICES)
  gpu-mode                           # same idea for KDE (reads KWIN_DRM_DEVICES)

caelestia-fork-changed-configs/      # small edits I made to EnceladusII/caelestia's OWN files (see credit)
  execs.conf                         # ~/.config/hypr/hyprland/execs.conf — night-light (gammastep) autostart disabled
  monitors-default.conf              # ~/.config/hypr/hyprland/monitors/default.conf — eDP-1 set to 1.25 scale

install/                             # the upstream installer + my patch (for reference)
  install.fish.ORIGINAL              # EnceladusII/caelestia-fedora's install.fish (upstream, unmodified)
  install.fish.PATCHED               # my patched copy (Nobara/Fedora 43 fixes)
  install.fish.patch                 # the diff between them
```

## How the GPU routing works (the centerpiece)

This laptop is muxless Intel+NVIDIA. Undocked, the desktop renders on **Intel** (battery-friendly, laptop panel is Intel-wired). When an external monitor is connected to the **NVIDIA**-wired HDMI port, the session renders on **NVIDIA** to avoid cross-GPU copy stutter.

- **Hyprland:** `config/uwsm/env-hyprland` detects, at session start, whether any connector on the NVIDIA card is `connected` (by reading `/sys/class/drm/...`, identifying GPUs by **PCI vendor ID** so `cardN` renumbering across boots doesn't matter). If so it exports `AQ_DRM_DEVICES="<nvidia>:<intel>"`; otherwise it exports nothing (stays on Intel).
- **KDE:** `config/plasma-workspace/env/gpu.sh` does the identical thing, emitting `KWIN_DRM_DEVICES`.

Check what's actually rendering: `aq-gpu-mode` (Hyprland) or `gpu-mode` (KDE).

## Using these

- **`hypr-user.conf`** → `~/.config/caelestia/hypr-user.conf`. Caelestia's `hyprland.conf` sources this file **last**, so settings here override the shipped config and survive a `git pull` of the shell. This is the safe place for personal Hyprland tweaks.
- **`uwsm/*`** → `~/.config/uwsm/`. Append the GPU block / PATH line to your existing files; don't blindly overwrite.
- **`local-bin/*`** → `~/.local/bin/` (and `chmod +x`). Bind `display-mode` to keys (see `hypr-user.conf`).
- **`caelestia-fork-changed-configs/*`** are edits to the *shell fork's* files — apply the equivalent change in your own copy; a `git pull` of the shell reverts them.

Monitor connector names (`eDP-1`, `HDMI-A-1`) and scales are specific to this laptop — adjust for yours.

## License

[MIT](LICENSE) for my own configs and scripts. The vendored `install.fish*` and the two
`caelestia-fork-changed-configs/` files originate from
[EnceladusII/caelestia-fedora](https://github.com/EnceladusII/caelestia-fedora) /
[caelestia-dots](https://github.com/caelestia-dots) and remain under their respective upstream licenses.
