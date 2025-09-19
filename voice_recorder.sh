#!/bin/bash
# deps ffmpeg, yad
RECORDING_DIR="$HOME/voice_mems"
CODEC="mp3"
INPUT_DEVICE="default"

# --- Script logic ---
mkdir -p "$RECORDING_DIR"

OUTPUT_FILE="$RECORDING_DIR/voice_memo-$(date +%Y%m%d%H%M%S).$CODEC"

if pgrep -f "ffmpeg -f alsa -i $INPUT_DEVICE" > /dev/null; then
    pkill -f "ffmpeg -f alsa -i $INPUT_DEVICE"
    yad --info --title="Recording Finished" --text="Recording saved to $OUTPUT_FILE"
else
    (sleep 1 && ffmpeg -f alsa -i "$INPUT_DEVICE" -c:a "$CODEC" "$OUTPUT_FILE") &
    yad --notification --text="Recording started..."
fi
