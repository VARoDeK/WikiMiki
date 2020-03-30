
---

| [Home](/README.md) | [Index](./README.md) | [Back](./README.md) | [Next](./2_bootable_program_for_x86.md) |
| :---: | :---: | :---: | :---: |

---

# Run a Bootable Program using Qemu

We will use programs written for __`x86`__ .

---

## Writing the program.

I am using `nasm` assembler on `x86_64` machine. Suppose below is the "Hello World" bootable assembly code:

```nasm
; boot.asm
   mov ax, 0x07c0
   mov ds, ax
 
   mov si, msg
   cld
ch_loop:lodsb
   or al, al ; zero=end or str
   jz hang   ; get out
   mov ah, 0x0E
   mov bh, 0
   int 0x10
   jmp ch_loop
 
hang:
   jmp hang
 
msg   db 'Hello World', 13, 10, 0
   times 510-($-$$) db 0
   db 0x55
   db 0xAA
```

__Save the the code in `boot.asm` file. You can choose any name.__

Code Taken from https://wiki.osdev.org/index.php?title=Babystep2&oldid=23021 .

---

## Assembling the code

```shell
nasm boot.asm -f bin -o boot.bin
```

You can check the hex digest of the output `.bin` file:

```shell
od -t x1 -A n boot_sect.bin
```

---

## Run the Code

### 1) - Using `-nographic`

```shell
qemu-system-x86_64 boot.bin -nographic
```

__To Exit :__

* Press `ctrl+a` and release keys.
* Then press `x`. 

---

### 2) - Using `vnc`

I am using `tigervnc` for vnc-viewer.

__Step 1: Open Terminal 1__

```shell
qemu-system-x86_64 boot.bin
```

It will show some output. On my system the Output was:

```shell
# WARNING: Image format was not specified for 'boot.bin' and probing guessed raw.
#         Automatically detecting the format is dangerous for raw images, write operations on block 0 will be restricted.
#         Specify the 'raw' format explicitly to remove the restrictions.
# VNC server running on ::1:5900
```

Hence the output will be sent to 127.0.0.1:5900

__Step 2: Open Terminal 2__

```shell
vncviewer 127.0.0.1:5900
```

You will see the output in a window.

---