#!/bin/bash

# Esse arquivo deve ser executado dentro do chroot para configuração da instalação do Arch Linux
# Basta executar o aruivo passando como primeiro parametro o nome do usuário a ser criado e como segundo parametro a senha
# exemplo: arch-base-install.sh meu_usuario minha_senha


pacman -Sy

ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc
sed -i 's/^# *pt_BR.UTF-8/pt_BR.UTF-8/g' /etc/locale.gen
locale-gen
echo "LANG=pt_BR.UTF-8" >> /etc/locale.conf
echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf

#HOSTNAME=arch
pacman -S  jq curl
POKENUMBER=$(shuf -i 1-898 -n 1)
HOSTNAME=$(curl https://pokeapi.co/api/v2/pokemon/$POKENUMBER/ | jq -r '.name')
echo $HOSTNAME > /etc/hostname

echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 $HOSTNAME.localdomain $HOSTNAME" >> /etc/hosts

pacman -S grub efibootmgr networkmanager network-manager-applet pulseaudio nvidia sudo
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
useradd -m $1
echo "root:$2" | chpasswd
echo "$1:$2" | chpasswd

usermod -aG wheel $1

echo -e "\n.:: Instalação concluída, nome da máquina:\033[1m $HOSTNAME \033[0m::.\n"
echo -e "\nAgora execute\033[1m visudo\033[0m para dar acesso sudo ao grupo wheel\n"
