# ⌨️ Keybindings cheat-sheet — Caelestia (Hyprland) on Nobara

Complete current keybind set, with the `$kb*` variables resolved to real keys. Reflects the **live**
config after my customizations.

**Legend**
- ⭐ = **my customization** — lives in `~/.config/caelestia/hypr-user.conf` (update-safe; overrides the fork).
- (no mark) = **Caelestia/fork default** — from `~/.config/hypr/hyprland/keybinds.conf` + `~/.config/hypr/variables.conf`.
- `Super` = the ⊞ / Meta key. Keys joined with `+` are held together.

> Sources: `keybinds.conf` (fork defaults) · `variables.conf` (`$kb*` definitions + app vars) ·
> `hypr-user.conf` (my overrides). **Never edit the fork files** — put changes in `hypr-user.conf` and
> `hyprctl reload`. (Symptom→file troubleshooting lives in the private `caelestia-nobara-setup-guide` repo.)

---

## 🚀 Launching apps

| Keys | Action | |
|---|---|---|
| `Super` (tap) | App launcher (fuzzel/caelestia) | |
| `Super + T` | Terminal (`foot`) | |
| `Super + B` | **Brave** (`--password-store=kwallet6`) | ⭐ *(was Firefox/Zen)* |
| `Super + C` | **Zed** editor | ⭐ *(was codium)* |
| `Super + O` | **OBS** | ⭐ |
| `Super + Shift + D` | **Dolphin** file manager | ⭐ |
| `Super + E` | Files (`nautilus`) | |
| `Ctrl + Alt + Escape` | Process viewer (`qps`) | |
| `Ctrl + Alt + V` | Audio mixer (`pavucontrol`) | |

> The fork's app variables default to `$browser = firefox` and `$editor = codium`; both are overridden
> above. Every Brave window/PWA needs its own `--password-store=kwallet6`.

---

## 🗂️ Special-workspace toggles (one app each, panel-style)

| Keys | Action | |
|---|---|---|
| `Super + M` | Toggle **music** workspace (Strawberry ⭐ routed here) | |
| `Super + D` | Toggle **communication** workspace (WhatsApp ⭐ routed here) | |
| `Super + R` | Toggle **todo** workspace | |
| `Ctrl + Shift + Escape` | Toggle **sysmon** workspace (btop) | |
| `Super + S` | Toggle the generic special workspace | |

> The apps are assigned via window rules (`rules.conf` defaults + my additions in `hypr-user.conf`).

---

## 🪟 Window management

| Keys | Action | |
|---|---|---|
| `Super + ←/→/↑/↓` | Move focus left/right/up/down | |
| `Super + Shift + ←/→/↑/↓` | Move window within workspace | |
| `Super + Z` (drag) / `Super + LMB` | Move window | |
| `Super + X` (drag) / `Super + RMB` | Resize window | |
| `Super + − / +` | Adjust split ratio | |
| `Super + Q` | Close window | |
| `Super + F` | Fullscreen | |
| `Super + Alt + F` | Fullscreen **with borders** | |
| `Super + Alt + Space` | Toggle floating | |
| `Super + P` | Pin window (sticky across workspaces) | |
| `Super + Alt + \` | Picture-in-picture | |
| `Ctrl + Super + \` | Center window | |
| `Ctrl + Super + Alt + \` | Resize to 55%×70% + center | |
| `Alt + Tab` | Jump to last-focused window (across workspaces) | |
| `Super + Tab` | Cycle windows on current workspace | |
| `Super + Comma` | Toggle group (tabbed) | |
| `Super + U` | Move window out of group | |
| `Super + Shift + Comma` | Lock active group | |
| `Ctrl + Alt + Tab` | Next window in group | |
| `Ctrl + Shift + Alt + Tab` | Previous window in group | |

---

## 🔢 Workspaces

| Keys | Action | |
|---|---|---|
| `Super + 1…0` | Go to workspace 1–10 | |
| `Ctrl + Super + 1…0` | Go to workspace **group** 1–10 | |
| `Ctrl + Super + ← / →` | Previous / next workspace | |
| `Super + PageUp / PageDown` | Previous / next workspace | |
| `Super + scroll` | Previous / next workspace | |
| `Super + Alt + 1…0` | Move window to workspace 1–10 | |
| `Ctrl + Super + Alt + 1…0` | Move window to workspace **group** | |
| `Ctrl + Super + Shift + ← / →` | Move window to prev / next workspace | |
| `Super + Alt + PageUp / PageDown` | Move window to prev / next workspace | |
| `Ctrl + Super + Shift + ↑` | Move window to special workspace | |
| `Ctrl + Super + Shift + ↓` | Move window back to current workspace | |
| `Super + Alt + S` | Move window to the generic special workspace | |

---

## 🖥️ Monitors & display modes

| Keys | Action | |
|---|---|---|
| `Super + Shift + 1` | Display-mode **laptop** (eDP-1 only) | ⭐ |
| `Super + Shift + 2` | Display-mode **external** (HDMI only) | ⭐ |
| `Super + Shift + 3` | Display-mode **extend** (laptop left of external… external left in layout) | ⭐ |
| `Super + Shift + 4` | Display-mode **mirror** | ⭐ |
| `Super + Alt + →` | Send window to **internal** monitor (eDP-1) | ⭐ |
| `Super + Alt + ←` | Send window to **external** monitor (HDMI-A-1) | ⭐ |

> Driven by `~/.local/bin/display-mode` (black-screen-safe). Layout: external `@0x0` (left), laptop
> `eDP-1 @1920x0` scale 1.25 (right).

---

## 🔊 Media & audio

| Keys | Action | |
|---|---|---|
| `XF86AudioRaiseVolume` / `LowerVolume` | Volume up / down (10%) | |
| `XF86AudioMute` | Mute output | |
| `Super + Shift + M` | Mute output | |
| `XF86AudioPlay` / `Pause` · `Ctrl + Super + Space` | Play/pause media | |
| `XF86AudioNext` · `Ctrl + Super + +` | Next track | |
| `XF86AudioPrev` · `Ctrl + Super + −` | Previous track | |
| `XF86AudioStop` | Stop | |
| `XF86MonBrightnessUp` / `Down` | **Internal** panel brightness | |

> External-monitor brightness is **not** on a keybind yet — use the monitor's physical buttons (or
> `ddcutil --display 1 setvcp 10 <0-100>`). See guide issue 13.

---

## 📸 Screenshots & recording

| Keys | Action | |
|---|---|---|
| `Print` | Full-screen screenshot → clipboard | |
| `Super + Shift + S` | Region screenshot (freeze) | |
| `Super + Shift + Alt + S` | Region screenshot | |
| `Super + Alt + R` | Record screen **with sound** | |
| `Ctrl + Alt + R` | Record screen | |
| `Super + Shift + Alt + R` | Record region | |
| `Super + Shift + C` | Colour picker (`hyprpicker`) | |

---

## 📋 Clipboard & emoji

| Keys | Action | |
|---|---|---|
| `Super + V` | Clipboard history | |
| `Super + Alt + V` | Clipboard history (delete entries) | |
| `Super + Period` | Emoji picker | |
| `Ctrl + Shift + Alt + V` | Alternate paste (types via `ydotool`) | |

---

## ⚙️ Session & system

| Keys | Action | |
|---|---|---|
| `Ctrl + Alt + Delete` | Session menu (logout / shutdown / reboot / sleep) | |
| `Super + L` | Lock screen | |
| `Super + Alt + L` | Restore / re-lock | |
| `Super + Shift + L` | **Suspend** (`systemctl suspend`) | ⭐ *(was suspend-then-hibernate — hibernate disabled)* |
| `Super + K` | Show all shell panels | |
| `Ctrl + Alt + C` | Clear notifications | |
| `Ctrl + Super + Shift + R` | Kill the shell | |
| `Ctrl + Super + Alt + R` | Restart the shell | |

---

## 🖱️ Terminal (foot — separate from Hyprland)

| Keys | Action | |
|---|---|---|
| `Ctrl + C` | Copy (when text selected) / SIGINT (when not) | ⭐ |
| `Ctrl + V` | Paste | ⭐ |
| `Ctrl + Shift + C` / `Ctrl + Shift + V` | Copy / paste (also work) | |

> In `~/.config/foot/foot.ini` `[key-bindings]`. **foot reads config only in new windows.**

---

## 🗑️ Removed / repurposed today (for reference)

| Was | Default action | Now | |
|---|---|---|---|
| `Super + C` | codium (not installed) | Zed | ⭐ |
| `Super + B` | Firefox + Zen-flatpak (not installed) | Brave | ⭐ |
| `Super + Shift + L` | suspend-then-hibernate (white-screens NVIDIA) | plain suspend | ⭐ |
| `Ctrl + Super + S` | flameshot (not installed → error popup) | **unbound** | ⭐ |
| `Super + Alt + 1…4` | *(shadowed by old display-mode binds)* | restored to move-to-workspace | ⭐ |
| `Super + Ctrl + ← / →` | *(old move-to-monitor binds, collided)* | removed → prev/next workspace restored | ⭐ |
