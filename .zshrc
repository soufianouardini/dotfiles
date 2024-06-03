##### source config files
shellConfigPath="$HOME/.shconf/rc"
# loading common shell config files
for file in $shellConfigPath/*; do 
  if [[ -f $file ]];then
    if [[ "${f##*.}" != "ignore" ]]; then
      source "$file"
    fi
  fi
done
# loading default shell config files
defaultShell="";
if [[ -z $dynamicDefaultShell ]];then
  defaultShell=$(echo $SHELL | sed s@/bin/@@);
else
  defaultShell=$dynamicDefaultShell;
fi

for file in $shellConfigPath/$defaultShell/*; do 
  if [[ "${f##*.}" != "ignore" ]]; then
    source "$file"
  fi
done

#! zap overrides the history settings
HISTSIZE=100000
SAVEHIST=100000

####### BELLOW ARE OTHER PACKAGES CONFIG - NOT ME

alias luamake=/luamake

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/venego/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

if [ -e /home/venego/.nix-profile/etc/profile.d/nix.sh ]; then . /home/venego/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
# pnpm end

# golang needs its own special path :(
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export GOPATH=$HOME/go/bin
export PATH=$PATH:$GOBIN
