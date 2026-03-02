#!/bin/bash

# Проверка, что запущен с root
if [[ $EUID -ne 0 ]]; then
  echo "Ебанат запусти с  root: sudo $0"
  exit 1
fi

echo "[1/8] Снос камеры с ядра нахуй..."
modprobe -r uvcvideo 2>/dev/null || echo "Модуль uvcvideo не загружен — пошел нахуй."

echo "[2/8] Добавление uvcvideo в blacklist..."
mkdir -p /etc/modprobe.d
echo "blacklist uvcvideo" > /etc/modprobe.d/blacklist.conf

echo "[3/8] Редактирование /etc/default/grub..."
cp /etc/default/grub /etc/default/grub.bak

# Меняем параметры GRUB
sed -i "s/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT='0'/" /etc/default/grub
sed -i "s/^GRUB_TIMEOUT_STYLE=.*/GRUB_TIMEOUT_STYLE=hidden/" /etc/default/grub
sed -i 's/splash//' /etc/default/grub

echo "[4/8] Удаление plymouth из mkinitcpio.conf..."
cp /etc/mkinitcpio.conf /etc/mkinitcpio.conf.bak
sed -i 's/plymouth //g' /etc/mkinitcpio.conf

echo "[5/8] Удаление пакетов plymouth и cachyos-plymouth-bootanimation..."
pacman -Rns --noconfirm plymouth cachyos-plymouth-bootanimation

echo "[6/8] Отключение ненужных systemd сервисов..."
systemctl disable systemd-boot-system-token.service
systemctl disable systemd-networkd-wait-online.service

echo "[7/8] Перекомпиляция конфига GRUB..."
grub-mkconfig -o /boot/grub/grub.cfg

echo "[8/8] Перекомпиляция initramfs..."
mkinitcpio -P

echo "✅ Теперь твоя камера удалена и вход в систему быстрее✅"
