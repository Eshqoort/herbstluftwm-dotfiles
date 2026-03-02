 fastfetch --logo ~/.config/fastfetch/ascii.txt
 
# Create aliases
alias cls="clear"
alias g="git"
alias m="micro"
alias f="fd"
alias ls="lsd"
alias sleep="systemctl suspend"
alias light="brightnessctl set 100"
alias dark="brightnessctl set 0"
alias hconf="micro ~/.config/herbstluftwm/autostart"
alias vencord="./.config/herbstluftwm/vencord.sh"

set -g fish_color_command '#cba6f7'
set -gx EDITOR micro
set -gx VISUAL micro
set -gx BROWSER /usr/bin/librewolf 


if status is-interactive
    # Commands to run in interactive sessions can go here
end

