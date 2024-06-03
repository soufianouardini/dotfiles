#!/bin/bash

### hot key daemon - MUST RUN AFTER I3
function hotkey(){
  APP_NAME=sxhkd
  killall -9 $APP_NAME
  sleep 2
  $APP_NAME -c "$HOME/.config/$APP_NAME/i3" "$HOME/.config/$APP_NAME/general" > /dev/null & disown
}
hotkey&
