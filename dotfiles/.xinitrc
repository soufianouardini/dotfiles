#!/bin/bash

if [[ $(tty) == "/dev/tty1" ]]; then
	source ~/.xdesktop
elif [[ $(tty) == "/dev/tty2" ]]; then
	while [[ true ]]; do
		google-chrome
	done
fi

# i3
