
---

| [Home](/README.md) | [Index](./README.md) | [Back](./1_clone_and_build_linux_kernel_from_source_install_or_uninstall.md) | [Next](./3_start_or_stop_or_enable_or_diable_systemd_services.md) |
| :---: | :---: | :---: | :---: |

---
# How to install a package from AUR.

```shell
git clone <link to git file>
cd <cloned-folder>
makepkg -si
```

---

# Solve: Missing PGP key signature

* Solution 1 - Import PGP Key

```shell
gpg --recv-keys <KEYID - See 'validpgpkeys' array in PKGBUILD>
```

* Solution 2 - Skip PGP signature check

```shell
makepkg --skippgpcheck -si
```

---

If you made some changes to contents in cloned folder, for example when I installed VS-Code, VS-Code used to change default-application to open directories to itself, so I had to change its entry, re calculate its sha256-sum and reflect the new sum in its pkg build file.

I will include the whole process once i get time.

---
