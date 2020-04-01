
---

| [Home](/README.md) | [Index](./README.md) | [Back](./OS_Installation/2_install_gui.md) | [Next](./2_install_a_package_from_aur.md) |
| :---: | :---: | :---: | :---: |

---

# Clone and Build your own Linux Kernel from Source and Install It

The content is inspired from: 
* Linux Foundation Course [LFD103](https://training.linuxfoundation.org/training/a-beginners-guide-to-linux-kernel-development-lfd103/).
* ArchWiki - [Kernel/Traditional compilation](https://wiki.archlinux.org/index.php/Kernel/Traditional_compilation).

The steps below are to install linux-5.5.9 _(stable)_. The Kernel can be found on https://git.kernel.org/ .

Steps are same for any version, any kernel tree.

---

## Step 1 - Clone Source

```shell
git clone https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/ linux_stable

cd linux_stable
```

---

## Step 2 - Shift to latest branch

Since it is `linux-5` the branch should be of form __linux-5.a.b__, where 'a' and 'b' can be any number. Let's find out.

```shell
git branch -a | grep linux-5
```
It will show the list of branches, for me it was:

```
#        $ git branch -a | grep linux-5
#            linux-5.5.y
#            remotes/origin/linux-5.0.y
#            remotes/origin/linux-5.1.y
#            remotes/origin/linux-5.2.y
#            remotes/origin/linux-5.3.y
#            remotes/origin/linux-5.4.y
#            remotes/origin/linux-5.5.y
```
So, `linux-5.5.y` it is.

```shell
git checkout linux-5.5.y
```
---

## Step 3 - Copy `config` File

The `.config` file can be found in two places:
1) /boot
   * Here it can be found with name, for example, `config-5.0.0-21-generic`.
2) /proc
   * Here it can be found with name, for example, `config.gz`

As you can see, for `/proc`, the config file is present in compressed form. Hence I made another folder, outside the `linux_stable` repo, with name `linux_config` and unzipped the `config.gz` in it.

```shell
mkdir ../linux_config

cp /proc/config.gz ../linux_config

gunzip ../linux_config/config.gz

ls ../linux_config
# config
```

Then I copied the file.

```shell
cp ../linux_config/config ./.config
```

---

## Step 4 - Configure your Kernel

To generate the configuration file based on the current configuration:

```shell
make oldconfig
```

To trim your Kernel more and make configuration file based on the modules loaded currently on your system:

```shell
make localmodconfig
```

---

## Step 5 - `make`

```shell
make -j$(nproc) all
```

---

## Step 6 - Install Modules

```shell
sudo make modules_install
```

---

## Step 7 - Copy the kernel to /boot directory

Now, If I checked the `Makefile`. The first 4 lines were:

```
#            # SPDX-License-Identifier: GPL-2.0
#            VERSION = 5
#            PATCHLEVEL = 5
#            SUBLEVEL = 9
```
Hence, the full name of my kernel is: `linux-5.5.9`.

So I decided to keep the name of my compiled kernel as: `linux5_5_9`.

* 32-bit (i686) kernel:

```shell
sudo cp -v arch/x86/boot/bzImage /boot/vmlinuz-linux5_5_9
```

* 64-bit (x86_64) kernel:

```shell
sudo cp -v arch/x86_64/boot/bzImage /boot/vmlinuz-linux5_5_9
```
---

## Step 8 - Make initial RAM disk

__Make sure you have `mkinitcpio` installed.__

First, copy the existing preset file, renaming it to match the name of the compiled kernel. 

```shell
sudo cp /etc/mkinitcpio.d/linux.preset /etc/mkinitcpio.d/linux5_5_9.preset
```

Second, edit the file and amend for the custom kernel.

```shell
sudo vim /etc/mkinitcpio.d/linux5_5_9.preset
```
Now, my modified preset looked like this:

```
#            # mkinitcpio preset file for the 'linux' package
#
#            ALL_config="/etc/mkinitcpio.conf"
#            ALL_kver="/boot/vmlinuz-linux5_5_9"
#
#            PRESETS=('default' 'fallback')
#
#            #default_config="/etc/mkinitcpio.conf"
#            default_image="/boot/initramfs-linux5_5_9.img"
#            #default_options=""
#
#            #fallback_config="/etc/mkinitcpio.conf"
#            fallback_image="/boot/initramfs-linux-fallback5_5_9.img"
#            fallback_options="-S autodetect"
```

Since, my compiled kernel name is, `linux5_5_9`, thus you can see the same name are used here:
* `ALL_kver="/boot/vmlinuz-linux5_5_9"`
* `default_image="/boot/initramfs-linux5_5_9.img"`
* `fallback_image="/boot/initramfs-linux-fallback5_5_9.img"`

Finally, generate the initramfs images

```shell
sudo mkinitcpio -p linux5_5_9
```

---

## Step 9 - Copy System.map

Since, I use UEFI boot method, the boot partiiton in `FAT32`, hence doesn't support symlinks.

Thus I backed up my old `System.map` to `System.bkp`, and loaded new one.

```shell
sudo mv /boot/System.map /boot/System.bkp

sudo cp System.map /boot/System.map
```
---

## Step 10 - Configure GRUB

```shell
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
---

## Step 11 - Make backup of `dmesg` for debugging and restart the system.

```shell
dmesg -t > dmesg_current
dmesg -t -k > dmesg_kernel
dmesg -t -l emerg > dmesg_current_emerg
dmesg -t -l alert > dmesg_current_alert
dmesg -t -l crit > dmesg_current_crit
dmesg -t -l err > dmesg_current_err
dmesg -t -l warn > dmesg_current_warn

poweroff
```
---

# To Uninstall The Kernel

```shell
sudo rm /boot/vmlinuz-linux5_5_9
sudo rm /boot/initramfs-linux5_5_9.img
sudo rm /boot/initramfs-linux-fallback5_5_9.img

sudo mv /boot/System.bkp /boot/System.map

sudo rm /etc/mkinitcpio.d/linux5_5_9.preset

# remove modules installed by kernel. (kernel version was 5.5.9)
sudo rm -rf /lib/modules/5.5.9

sudo grub-mkconfig -o /boot/grub/grub.cfg
```
---

