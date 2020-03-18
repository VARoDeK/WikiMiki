
---

| [Home](/README.md) | [Index](./README.md) | [Back](./1_install_cui.md) | [Next](../1_clone_and_build_linux_kernel_from_source_install_or_uninstall.md) |
| :---: | :---: | :---: | :---: |

---
# First you need to install the [Arch CUI](./1_install_cui.md).

---

For GUI you need several things:
* Display Server (_We will use Xorg_)
* Display Driver (_We will use NVIDIA and Intel Graphics_)
* Desktop Environment (_We will use Gnome_)
* Display Manager (_We will use GDM_)

[Graphical User Interface](https://wiki.archlinux.org/index.php/General_recommendations#Graphical_user_interface).

Refer the above link to download the softwares of your choice.

---

## Display Server
To see servers other than Xorg visit [here](https://wiki.archlinux.org/index.php/General_recommendations#Display_server)

For Xorg, run the following command:

```shell
sudo pacman -S xorg-server`
```

(_For Noobs: 'sudo' gives admin rights to a command. You need to enter the password, which you feeded for the user, you are logged into._)

---

## Display Driver
Note: Drivers may vary according to the Display Server You have installed. This page strictly follows for Xorg.

For NVIDIA, you need to refer [this](https://wiki.archlinux.org/index.php/NVIDIA) page to find the correct driver for your version of NVIDIA.
For example I have NVIDIA 940M, so it belongs to NVE0, NV110 and NV130 family cards from around 2010-2019.

Hence I can install the `dkms` module.

```shell
sudo pacman -S nvidia-dkms nvidia-utils nvidia-settings
```

If your intel chip is also having integrated graphics then `mesa` is required. (_Following is tested for Xorg Server_ [Check Here](https://wiki.archlinux.org/index.php/Xorg#Driver_installation))

```shell
sudo pacman -S mesa
```

---

## Desktop Environment
Run the following command:

```shell
sudo pacman -S gnome gnome-extra
```

---

## Display Manager
Since we have installed Gnome, we need to install `gdm` as display manager. See [here](https://wiki.archlinux.org/index.php/Display_manager#Graphical).
Run the following command:

```shell
sudo pacman -S gdm
```

Then we need to enable it:

```shell
sudo systemctl enable gdm.service
```

---

## Re-start your PC. Welcome to GUI.

---

## For Wireless

Refer [this](https://wiki.archlinux.org/index.php/Wireless_network_configuration) page to get wireless configuration on your system.
I am using Broadcom manufactured wireless module.
To know what driver(s) are operable on the computer's Broadcom wireless network device, the device ID and chipset name will need to be detected. 

```shell
lspci -vnn -d 14e4:
```  

I can use the latest drivers. Hence I am using the `dkms` version.

```shell
sudo pacman -S broadcom-wl-dkms
```

#### Now re-start your PC.

Search the name of your wire-less interface.

```shell
ip link
```

In my case, the name of my wire-less interface is **'wlo1'**.
To connect to internet through it:

```shell
sudo wifi-menu wlo1
```

Using arrow keys, select the Network and enter passID and done!.

---