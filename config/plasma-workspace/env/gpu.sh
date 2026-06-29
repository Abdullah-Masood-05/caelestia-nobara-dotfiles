#!/bin/sh
# Auto-select the KWin render GPU at login.
# If an external display is attached to the NVIDIA GPU (HDMI/Mini-DP),
# render the desktop on NVIDIA. Otherwise stay on Intel (mobile/battery).

nvidia_card=""
intel_card=""
for d in /sys/class/drm/card[0-9]*; do
    name=${d##*/}
    case "$name" in *-*) continue ;; esac      # skip connector subdirs
    v=$(cat "$d/device/vendor" 2>/dev/null)
    [ "$v" = "0x10de" ] && nvidia_card="$name"  # NVIDIA
    [ "$v" = "0x8086" ] && intel_card="$name"   # Intel
done

if [ -n "$nvidia_card" ] && [ -n "$intel_card" ]; then
    for s in /sys/class/drm/"$nvidia_card"-*/status; do
        [ -e "$s" ] || continue
        if [ "$(cat "$s" 2>/dev/null)" = "connected" ]; then
            export KWIN_DRM_DEVICES="/dev/dri/$nvidia_card:/dev/dri/$intel_card"
            break
        fi
    done
fi
