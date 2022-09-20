
---

| [Home](/README.md) | [Index](./README.md) | [Back](./4_google_summer_of_code.md) | [Next](./6_xargs_cheat_sheet.md) |
| :---: | :---: | :---: | :---: |

---

# Some useful Linux Commands

### 1) - `$ convert xyz.pdf xyz.jpg`

__Case__ : You want to convert a padf file into an image. Not just `JPEG`, it can also be used for `PNG` image formats.

__App/Package Required__ : `imagemagick` .

__Note__ : The `convert` tool may not be able to parse pdf file because of default policy. Refer [ImageMagick - ArchWiki](https://wiki.archlinux.org/title/ImageMagick).

To get high quality image:

```shell
convert -density 300 -quality 100 xyz.pdf xyz.jpg
```

---

### 2) - `$ openssl <crypto algorithm> -[e|d] -in <input file> -out <output file>`

__Case__ : You want to encrypt/decrypt a file.

For the example let's use `aes-256-cbc` crypto algrithm for encryption and decryption.

Encrypt:

```shell
openssl aes-256-cbc -e -in 1 -out 1.e
```
Decrypt:

```shell
openssl aes-256-cbc -d -in 1.e -out 1
```

---

### 3) - `$ magick mogrify -format gif *.webp -debug events`

__Case__ : You want to convert all `.webp` images to `.gif`.

```shell
magick mogrify -format gif *.webp -debug events
```

---

### 4) - `$ mogrify -rotate <angle> xyz.gif`

__Case__ : You want to rotate `.gif` images.

```shell
mogrify -rotate -90 xyz.gif
```

---

### 5) - `$ ffmpeg -i <input video file> -ss <start time> -t <end time> -async 1 <output file>`

__Case__ : You want a small clip from a big video file.

For example, you have 02:00:00 (2 hours) movie file _xyz.mp4_. You want a 20 seconds clip from it, starting at 00:00:20.

```shell
ffmpeg -i xyz.mp4 -ss 00:00:20 -t 00:00:40 -async 1 out.mp4
```

---

### 6) - `$ cscope -b -q -k -R`

__Case__ : You want to build a cscope database for Linux Kernel.

* __-b__ : This flag tells Cscope to just build the database, and not launch the Cscope GUI.
  
* __-q__ : The flag causes an additional, 'inverted index' file to be created, which makes searches run much faster for large databases. 
  
* __-k__ : This flag sets Cscope's 'kernel' mode; it will not look in `/usr/include` for any header files that are #included in your source files (this is mainly useful when you are using Cscope with operating system and/or C library source code, as we are here).
  
* __-R__ : This flag tells Cscope to recurse subdirectories during search for source files.

```shell
cscope -b -q -k -R
```

---