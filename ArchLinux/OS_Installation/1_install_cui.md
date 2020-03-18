
---

| [Home](/README.md) | [Index](./README.md) | [Back](./README.md) | [Next](./2_install_gui.md) |
| :---: | :---: | :---: | :---: |

---

# Introduction
The ISO image provided by ArchLinux has only Command Line Interface. GUI can be added later. Hence first we need to Install ISO, to do so follow this guide.

* If you have already installed the ISO and are ready to install GUI, refer [here](./2_install_gui.md).

---

# Pre-Installation

## 1 - First Download Arch and make a Bootable Pendrive
* [Download Arch From Here](https://www.archlinux.org/download/).
* Download ISO File.
* Make a bootable pendrive. You can use [Balena - Etcher](https://www.balena.io/etcher/) for this purpose. It's a very handy and easy to use tool for burning Linux images.

---

## 2 - Boot your system with your bootable pendrive

---

## 3 - Verify the Boot Mode
Run the following Command:

```shell
ls /sys/firmware/efi/efivars
```

If some output is given, it means `ls` command is able to read `efivars` directory, hence UEFI mode is enabled on your system.

---

## 4 - Connect to internet
* If you have ethernet connection, just plug it in and run the command:

```shell
dhcpcd
```

* Else figure out your interface using the command:

```shell
ip link
```

and connect to it. [Refer Here](https://wiki.archlinux.org/index.php/Installation_guide#Connect_to_the_internet).
* The connection may be verified with `ping`. Run the following command:

```shell
ping -c 3 archlinux.org
```

---

## 5 - Update the system clock

```shell
timedatectl set-ntp true
```

---

## 6 - Partition Disk
Run the following command:

```shell
lsblk -o name,size,type,mountpoint,fstype
```

This will print the list of storage drives and thier pre-existing partitions with their file-system types.
The Partitions are written in form of `sdxn`.

**x** - tells the storage device character.

**n** - tells the partition number.

For example, my HDD has three partitions. And its the only secondary memory device in my laptop. It's partitions are named as:
* `sda1`
* `sda2`
* `sda3`
* `sda4`

Recommended - Make three partitions for installing Arch Linux.
I will exaplin it with the help of my system.

| Partition Name | Partition Type | Purpose |  Size |
| :-------------: | :--------------: | :-------: | :---: |
| `sda1`        | vfat           | GRUB/efi | 1G |
| `sda2`        | ext4           | `/` | 350G |
| `sda3`        | ext4           | `/home` | 567G |
| `sda4`        | swap           | `swap` | 11.3G |

Note - The size of swap (sda4 in my case) should be almost eqal to the size of your RAM.

---

## 7 - Coverting Partiton-Type of each Partition
I will explain it using the partitions of my own system. **Use the partition name of your drive in your system**.

* `sda1` should be of `vfat` type.

```shell
mkfs.fat -F32 /dev/sda1
```

* `sda2` should be of `ext4` type.

```shell
mkfs.ext4 /dev/sda2
```

* `sda2` should be of `ext4` type.

```shell
mkfs.ext4 /dev/sda3
```

* `sda3` should be of `ext4` type.

```shell
mkswap /dev/sda4
swapon /dev/sda4
```

---

## 8 - Mount File Systems
Run the Following Commands:

```shell
mkdir /mnt/boot
mount /dev/sda2 /mnt
```

---

# Installation

---

## 1 - Installing the base packages

Run the Following Command:

```shell
pacstrap /mnt base base-devel linux linux-firmware dialog iw wpa_supplicant sudo
```

---

# Configure the system

---

## 1 - Fstab
Generate and fstab file

```shell
genfstab -U /mnt >> /mnt/etc/fstab
```

---

## 2 - Chroot
Change root into new system

```shell
arch-chroot /mnt
```

---

## 3 - Time Zone
Now find out your time zone.

* Figure out your `Region` by running command: `$ ls /usr/share/zoneinfo`. It will list the region names present in the system. You need to see the region name for your location. For example, in my case, region is 'Asia'.
* Once you have got 'Region' you can figure out your `city` by running command: `$ ls /usr/share/zoneinfo/Region`. For example, I will run the command, `$ ls /usr/share/zoneinfo/Asia`.
* Hence my Region is Asia and City is Kolkata.

Run the command:

```shell
ln -sf /usr/share/zoneinfo/Asia/Kolkata
```

Run `hwclock` to generate `/etc/adjtime`

```shell
hwclock --systohc
```

---

## 4 - Locale
Install `vim`.

```shell
pacman -S vim
```

Open `/etc/locale.gen` usin `vim`.

```shell
vim /etc/locale.gen
```

* Using arrow keys find `#en_US.UTF-8 UTF-8`.
* Using arrow keys, place the cursor after **#** and press **i**.
* Using Backspace key, remove the **#**. Now, it will look like, `en_US.UTF-8 UTF 8`.
* Without Pressing any other key, press **Esc** key.
* Type **:wq** and hit enter.

Note: If you made any mistake while editing, don't panic, just press **Esc** key, type **qa!** and hit enter. Now again open the file using vim and follow steps.

Now run the following command:

```shell
locale-gen
```

Now, open `/etc/locale.conf` file using command:

```shell
vim /etc/locale.conf
```

* Press **i** and type:
 `LANG = en_US.UTF-8`
* Press **Esc** key.
* Type **:wq** and hit enter.

---

## 5 - Network Configuration
You need to give a hostname to your computer.
Let's say your hostname will be `NewHost`
Run the Following Command:

```shell
vim /etc/hostname
```

* Press **i** and type: `NewHost`
* Press **Esc** key.
* Type **:wq** and hit enter.

Note: If you made any mistake while editing, don't panic, just press **Esc** key, type **qa!** and hit enter. Now again open the file using vim and follow steps.

It may be assumed that you have got bit familiar with `vim`.
You also need to add matching entry to `/etc/hosts`.
Run the command:

```shell
vim /etc/hosts
```

* Press **i** key.
Now modify the file to make it look like this:

```shell
# 127.0.0.1    localhost.localdomain    localhost
# ::1          localhost.localdomain    localhost
# 127.0.1.1    NewHost.localdomain      NewHost
 ```

* Press **Esc** key.
* Type **:wq** and hit enter.

---

## 6 - Root Password
Feed password for the root user.
Run the Following Command: 

```shell
passwd
```

---

## 7 - Bootloader
If you have an Intel CPU, install the intel-ucode package

```shell
pacman -S intel-ucode
```

Now you need to remember if you have UEFI or not.

#### No UEFI

```shell 
pacman -S grub os-prober ntfs-3g

mount /dev/sda1 /boot

mount /dev/sda3 /home

grub-install --target=i386-pc /dev/sdx

grub-mkconfig -o /boot/grub/grub.cfg
```

Please replace **x** with the character of your Hard Disk.

#### With UEFI

```shell
pacman -S grub os-prober efibootmgr ntfs-3g

mount /dev/sda1 /boot

mount /dev/sda3 /home

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub

grub-mkconfig -o /boot/grub/grub.cfg
```

---

## 8 - New User
Now it's time to add new user. Suppose you want create a new user with name 'newuser'. Run the Following Command:

```shell
useradd -m -G wheel -s /bin/bash newuser
```

Here a new user with username 'newuser' was added and the default shell given to it is 'bash' (`/bin/bash`). You can change the shell.
For example I wanted a 'zsh' shell. So first I installed it `$ pacman -S zsh`, then the user adding command was modified to `$ useradd -m -G wheel -s /bin/zsh newuser`.

To add password for the 'newuser', run the following command:

```shell
passwd newuser
```


Now set up `sudo`.
Run the following command:

```shell
visudo
```

* Using arrow keys find the line,

```shell
## Uncomment to allow members of group wheel to execute any command
# %wheel ALL=(ALL) ALL
```  

* Now, carefully place your cursor on the **#** just before **%wheel** and press **x**. This will remove the **#**. It will now look like this:

```shell
## Uncomment to allow members of group wheel to execute any command
 %wheel ALL=(ALL) ALL
```

* Now type **:wq** and hit enter.

---

# Install important packages:

```shell
pacman -S wicd linux-headers linux-lts-headers
```

---

# Reboot

Exit the chroot environment by typing `$ exit` or pressing `Ctrl+D`.
Optionally manually unmount all the partitions with `$ umount -R /mnt`.

Finally, restart the machine by typing 

```shell
reboot
``` 

Remove the bootable pendrive.

Now while booting choose grub as the default boot option.
After booting, you will encounter a black screen with option to login. You can now log in with your user.
* You need to type username (_for this tutorial we took 'newuser'_).
* Enter Passowrd you added for this user. 

---

# Entry for `/home`

You may have to manually enter the details of `/dev/sda3` for mounting it on `/home` in `fstab` file.

---