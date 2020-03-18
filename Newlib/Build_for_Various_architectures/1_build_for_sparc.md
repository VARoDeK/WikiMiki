
---

| [Home](/README.md) | [Index](./README.md) | [Back](./README.md) | [Next](./2_build_for_arm.md) |
| :---: | :---: | :---: | :---: |

---

# Build/ Compile Newlib for SPARC

---

## Clone

```shell
mkdir -p development/newlib

cd development/newlib

git clone git://sourceware.org/git/newlib-cygwin.git

cd newlib-cygwin
```

---

## Conflict in version of autoconf

* We need to use autoconf 2.64.
* The default autoconf version on my system is 2.69
* So I had to build it seperately for 2.64 version and is loacted in /opt/
* But I need that when autoconf is called, 2.64 should be used and not 2.69.
* Linux has a concept of paths, these are stored in environment variable `PATH`.
* When you type a command in shell, Linux searches for the implementation of that command, in the directories given by the path.
* So I added the location of 2.64 to `$PATH` (`$ export PATH=/opt/autoconf/2.64/bin:$PATH`).

---

```shell
export PATH=/opt/autoconf/2.64/bin:$PATH

autoreconf -fvi

cd ..

mkdir b-sparc-rterms5-newlib

cd b-sparc-rtems5-newlib
```

Now Again, I need 2.69 version and RTEMS Toolchain.

```shell
export PATH=$HOME/development/rtems/5/bin:$PATH

../newlib-cygwin/configure --target=sparc-rtems5 --disable-shared --disable-nls --enable-werror --enable-newlib-supplied-syscalls --enable-interwork --enable-multilib --with-gnu-as --with-gnu-ld
```

```shell
make all
```

You don't really need to install install it for development. But if you want to, run `$ make install`.

---