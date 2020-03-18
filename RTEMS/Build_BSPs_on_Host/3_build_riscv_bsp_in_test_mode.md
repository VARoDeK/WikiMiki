
---

| [Home](/README.md) | [Index](./README.md) | [Back](./2_build_arm_bsp_in_test_mode.md) | [Next](../Documentation/README.md) |
| :---: | :---: | :---: | :---: |

---

# Set up RTEMS RISC-V BSP on Host OS

#### Note: Make sure you have `python 2.7` (devloper version), `python 3` and `pax` package installed on your system.

---

## RSB

### 1) - Setup RSB

```shell
cd

mkdir -p development/rtems && cd development/rtems

git clone git://git.rtems.org/rtems-source-builder.git rsb

cd rsb

./source-builder/sb-check

cd rtems

../source-builder/sb-set-builder --list-bsets
```

### 2) - Build Toolchain for SPARC using RSB

```shell
../source-builder/sb-set-builder --prefix=/home/varodek/development/rtems/5 5/rtems-riscv
```

---

## Build RTEMS using Toolchain

```shell
cd
cd development/rtems
mkdir kernel
cd kernel
```
```shell
git clone git://git.rtems.org/rtems.git rtems
```

### 1) - Bootstrapping

```shell
export PATH=$HOME/development/rtems/5/bin:$PATH 

cd rtems

./bootstrap -c && $HOME/development/rtems/rsb/source-builder/sb-bootstrap
```

### 2) - Building a BSP

```shell
cd ..
mkdir rv32imac
cd rv32imac
```

```shell
 /home/varodek/development/rtems/kernel/rtems/configure --prefix=/home/varodek/development/rtems/5 --enable-maintainer-mode --target=riscv-rtems5 --enable-rtemsbsp=rv32imac --enable-tests --enable-posix --disable-networking --enable-cxx
```

### 3) - Build using 2 cores

```shell
make -j 2
```

You don't really to install the BSP for development. But if you want to, run `$ make install`.

---