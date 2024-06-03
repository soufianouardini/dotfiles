COMMAND="$@"
FOCUSED=$(xprop -root _NET_ACTIVE_WINDOW | awk -F' ' '{print $NF}')

if xprop -id ${FOCUSED} _NET_WM_STATE | grep -q _NET_WM_STATE_FULLSCREEN; then
    # i3-msg "[id=${FOCUSED}] fullscreen disable"
    # i3-msg ${COMMAND}
    # FOCUSED=$(xprop -root _NET_ACTIVE_WINDOW | awk -F' ' '{print $NF}')
    # i3-msg "[id=${FOCUSED}] fullscreen enable"

    # I don't need to specify the window, it's automatically set to the focused one
    i3-msg "fullscreen disable"
    i3-msg ${COMMAND}
    i3-msg "fullscreen enable"
else
  i3-msg ${COMMAND}
fi
