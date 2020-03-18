
---

| [Home](/README.md) | [Index](./README.md) | [Back](./Build_for_Various_architectures/2_build_for_arm.md) | [Next](../Raspberry_Pi/README.md) |
| :---: | :---: | :---: | :---: |

---

# `b-sparc-rtems5-newlib` shows error when `make` command is run after makeing changes in `newlib` folder.

**Note:** it can happen for any architecture, for example it can also happen in `b-arm-rtems5-newlib`. As it is cause by `config.cache` file.

---

### We take the example of `b-sparc-rtems5-newlib` to solve this issue.

```shell
cd ~/development/newlib/b-sparc-rtems5-newlib

rm $(find ./ -name \config.cache)

make all

```

---