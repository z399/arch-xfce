#!/bin/bash

MAIN_PKG(){
model=$(lscpu | grep 'Model name')

case "$model" in
    *Intel*) GPUDRE="xf86-video-intel" ;;
    *AMD*) GPUDRE="xf86-video-amdgpu";;	
esac

printf "$GPUDRE"

sudo pacman -S xfce4 xfce4-goodies xdg-user-dirs arc-gtk-theme papirus-icon-theme \
gnome-calculator scrot pipewire pipewire-alsa qbittorrent mpv firefox chromium torbrowser-launcher \
github-cli gvfs-mtp gvfs file-roller neofetch ntfs-3g pavucontrol wget xorg-server xorg-xinit \
network-manager-applet telegram-desktop os-prober $GPUDRE xf86-input-libinput bluez bluez-utils blueman pipewire-pulse --needed --noconfirm
}


#EN_TLP(){
#sudo pacman -S tlp --needed --noconfirm
#sudo systemctl enable tlp.service
#}


EMERGE_CONF(){
cp -r .config .xinitrc .zshrc .fonts /$HOME/ 
fc-cache -fv
sudo systemctl enable bluetooth.service
#sudo echo "load-module module-switch-on-connect" > /etc/pulse/default.pa 
#sudo echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
#sudo grub-mkconfig -o /boot/grub/grub.cfg
#sudo echo '
#Section "InputClass"
#    Identifier "touchpad"
#    Driver "libinput"
#    MatchIsTouchpad "on"
#    Option "Tapping" "on"
#    Option "TappingButtonMap" "lmr"
#EndSection ' >> /etc/X11/xorg.conf.d/30-touchpad.conf
}

REBT(){
clear && /bin/echo -e '\n\n' "\e[1;32mREBOOTING IN ..3\e[0m"
sleep 1
/bin/echo -e '\n\n' "\e[1;32mREBOOTING IN ..2\e[0m"
sleep 1
/bin/echo -e '\n\n' "\e[1;32mREBOOTING IN ..1\e[0m"
sleep 1
/bin/echo -e '\n\n' "\e[1;32mREBOOTING NOW......\e[0m"
reboot
}

#begin
#=====

MAIN_PKG
EN_TLP
EMERGE_CONF
REBT












