export XDG_SESSION_TYPE="x11";
dbus-update-activation-environment XDG_SESSION_TYPE

##### source profile shell config files
profileShellConfigPath="$HOME/.shconf/profile"
for file in $profileShellConfigPath/*; do
	if [[ "${f##*.}" != "ignore" ]]; then
		source "$file"
	fi
done

## adding scripts and binaries to PATH
if [ -d $HOME/home/scripts ]; then
	export PATH="$HOME/home/scripts:$PATH"
fi
if [ -d "$HOME/bin" ]; then
	export PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ]; then
	export PATH="$HOME/.local/bin:$PATH"
fi
if [ -d $HOME/.nix-profile/bin ]; then
	export PATH="$HOME/.nix-profile/bin:$PATH"
fi
if [ -d $HOME/.deno/bin ]; then
	export PATH="$HOME/.deno/bin:$PATH"
fi

# vim mode
set -o vi

# auto start X
if [[ $(tty) == "/dev/tty1" ]]; then
	pgrep i3 || startx &
fi

## --------------------------------------- 3RD PARTY
