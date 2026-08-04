#!/usr/bin/env bash
# ==========================================================
# Tmux Floating Persistent Popup
# Theme-aware (Catppuccin / Bubble compatible)
# Toggle open/close with same keybind
# ==========================================================

SESSION_NAME="${1:-float_popup}"
WINDOW_NAME="${2:-term}"
START_DIR="${3:-$HOME}"

CURRENT_SESSION="$(tmux display-message -p '#{session_name}')"

# ----------------------------------------------------------
# If we are already inside the popup session → close popup
# ----------------------------------------------------------
if [ "$CURRENT_SESSION" = "$SESSION_NAME" ]; then
  tmux detach-client
  exit 0
fi

# ----------------------------------------------------------
# Create session if it does not exist
# ----------------------------------------------------------
if ! tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
  tmux new-session -d \
    -s "$SESSION_NAME" \
    -n "$WINDOW_NAME" \
    -c "$START_DIR"

  # Disable status bar inside popup
  tmux set-option -t "$SESSION_NAME" status off

  # --------------------------------------------------------
  # Catppuccin Mocha colors (manual, same as your tmux.conf)
  # --------------------------------------------------------
  tmux set-option -t "$SESSION_NAME" pane-border-style "fg=#6c7086"
  tmux set-option -t "$SESSION_NAME" pane-active-border-style "fg=#89b4fa"

  tmux set-option -t "$SESSION_NAME" message-style "bg=#1e1e2e,fg=#cdd6f4"
  tmux set-option -t "$SESSION_NAME" message-command-style "bg=#1e1e2e,fg=#cdd6f4"

  tmux set-option -t "$SESSION_NAME" display-panes-colour "#6c7086"
  tmux set-option -t "$SESSION_NAME" display-panes-active-colour "#89b4fa"

  # Ensure terminal consistency
  tmux set-option -t "$SESSION_NAME" default-terminal "tmux-256color"
fi

# ----------------------------------------------------------
# Open popup (centered, near fullscreen, themed)
# ----------------------------------------------------------
tmux popup \
  -d "#{pane_current_path}" \
  -x C -y C \
  -w 95% -h 95% \
  -E \
  "tmux attach -t $SESSION_NAME"
