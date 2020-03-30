
---

| [Home](/README.md) | [Index](./README.md) | [Back](./1_run_bootable_programs_using_qemu.md) | [Next](/Base_Mathematics/README.md) |
| :---: | :---: | :---: | :---: |

---

# Bootable 'Hello World' Program.

__Save the the code in `boot.asm` file. You can choose any name.__

Code Taken from https://wiki.osdev.org/index.php?title=Babystep2&oldid=23021 .

```nasm
;boot.asm
;The code in the boot sector of the disk is loaded by the BIOS at 0000:7c00.
   mov ax, 0x07c0
   mov ds, ax
   mov si, msg

; Since the 'Hello World' msg is contained in the program, the msg will
; be at some address ahead of 0x7c00.
;
; 'si' is Source Index Register. Used as source in some string processing
; instructions. Offset address relative to 'ds'.

   cld
; Clears the DF (direction flag) in the EFLAGS register. When the DF flag
; is set to 0, string operations increment the index registers (ESI and/or
; EDI).
; -----------------------------------------------------------------------------
; -----------------------------------------------------------------------------
ch_loop:
   lodsb
   ; loads a string byte into 'al' register. (character size is one byte).

   or al, al ; OR operation.
   jz hang   ; get out
   ; Since 'lodsb' loads a byte into 'al', if the 'Hello World' msg is read
   ; completely, and rest program is padded with zero, the 'loadsb' will
   ; load zero into 'al', 0|0 will be equal to zero and it also sets the
   ; zero flag.

   ; 'jz' (jump if zero) will then move to next task.

   mov ah, 0x0E
   mov bh, 0
   int 0x10
   ; Print using interrrupt.

   jmp ch_loop
 
; -----------------------------------------------------------------------------
; -----------------------------------------------------------------------------
hang:
   jmp hang    ; Infinite loop.

; -----------------------------------------------------------------------------
; -----------------------------------------------------------------------------
msg   db 'Hello World', 13, 10, 0
         ; ASCII value 13 means carriage return.
         ; ASCII value 10 means new line.
         ; ACII value 0 means NULL, end of string.
 
   times 510-($-$$) db 0
         ; '$' evaluates to the assembly position at the beginning of the line
         ; containing the expression. '$$' evaluates to the beginning of the
         ; current section; so you can tell how far into the section you are
         ; by using ($-$$).

   db 0x55
   db 0xAA
```

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

### 1) Using `-nographic`

```shell
qemu-system-x86_64 boot.bin -nographic
```

__To Exit :__

* Press `ctrl+a` and release keys.
* Then press `x`. 

---