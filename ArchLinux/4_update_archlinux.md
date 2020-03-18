
---

| [Home](/README.md) | [Index](./README.md) | [Back](./3_start_or_stop_or_enable_or_diable_systemd_services.md) | [Next](../Git/README.md)|
| :---: | :---: | :---: | :---: |

---

# Update command for Arch Linux

## Sometimes you need to refresh keys

```shell
sudo pacman -Sy archlinux-keyring

sudo pacman-key --refresh-keys
```

---

## Update

```shell
sudo pacman -Syu
```

---

## Update with Forece Update Mirror lists

```shell
sudo pacman -Syyu
```

---
