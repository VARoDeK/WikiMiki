
---

| [Home](/README.md) | [Index](./README.md) | [Back](./1_clone_and_build_linux_kernel_from_source_install_or_uninstall.md) | [Next](../Newlib/README.md) |
| :---: | :---: | :---: | :---: |

---

# Disable `CONFIG_PM` in Linux configuration file.

Developers working on Linux's power management code may need to test their code that if the power management is disabled in the kernel, their patch (s) should not break anything.

This is handled by `CONFIG_PM` field in the configuration file.

There might be many other cases where it has to be disabled. And to do so, follow these steps:

---

## Step 1 - Run `makemenuconfig`

1) In the root folder of the Linux repository, run:
```shell
make menuconfig
```
_Note: You need to install `dialog` package as `menuconfig` will have to display dialog boxes from shell scripts._

---

## Step 2 - Disable Xen-guest-support

1) Using arraw keys, go to: `Processor type and features -> Linux guest support`.
2) Place the cursor on "`Xen guest support`" and press \``n`\`.
3) Use arrow keys to select "`save`" (option present at bottom).
4) Go back to main menu.

---

## Step 3 - Disable Power-Management options

1) Go to: `Power management and ACPI options`.
2) Select "`Suspend to RAM and standby`" and press \``n`\`.
3) Select "`Hibernation (aka 'suspend to disk')`" and press \``n`\`.
4) Select "`Device power management core functionality`" and press \``n`\`.
5) Save it and exit.
   
---

## Step 4 - Build the Kernel

---