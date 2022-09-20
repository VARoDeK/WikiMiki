
---

| [Home](/README.md) | [Index](./README.md) | [Back](./8_find_cheat_sheet.md) | [Next]() |
| :---: | :---: | :---: | :---: |

---

# Vim Cheat Sheet

Just a quick description of terminologies.

__Overview__ : Vim has multiple operating modes:

[Refer](https://missing.csail.mit.edu/2020/editors/)

| Mode | Description |
| :---: | :--- |
| `Normal` | For moving around a file and making edits. |
| `Insert` | For inserting text. |
| `Replace` | For replacing text. |
| `Visual` </br>(plain, line, or block) | For selecting blocks of text. |
| `Command-line` | For running a command. |

---

In its default configuration, Vim shows the current mode in the bottom left. The initial/default mode is
`Normal` mode. You’ll generally spend most of your time between `Normal` mode and `Insert` mode.
You change modes by pressing `ESC` (the escape key) to switch from any mode back to `Normal`
mode. From `Normal` mode, enter:

| From `Normal` to: | Press |
| :--- | :--- |
| `Insert` mode | `i` |
| `Replace` mode | `R`  |
| `Visual` mode | `v` |
| `Visual` line mode | `V` or `Shift+v` |
| `Visual` block mode | `C-v` (`Ctrl-v`, sometimes also written `^v`) |
| `Command` mode | __`:`__ |

---

### 1) - Select lines between 'x' and 'y' (Including 'x' and 'y')

For example, in a file, you want to select only lines 6 to 108 (Including 6<sup>th</sup> and 108<sup>th</sup> line).

In normal mode:

1) Enter command - <code><b>:</b>6</code>.
2) Press - `m+a`.
3) Enter command - <code><b>:</b>108</code>.
4) Press - `shift+v` or `V`.
5) Press - `` `+a ``

---

### 2) - Shift multiple lines by a `tab`.

1) Select lines.
2) Press
   
   - `>` to add a `tab`.
   - `<` to delete a `tab`.

---

### 3) - To insert any character/ digit/ symbol at the starting of every line.

1) Enter `Visual` block mode (Press `Ctrl+v`).
2) Press - `Shift+i`.
3) Enter you character.
4) Press - `Esc`.
5) Wait for 2 sec.

---

### 4) - Search and replace.

__Case__: Search and replace first occurrence. In `Command` mode:

```vim
:s/<regex-to-be-replaced>/<regex-to-replace-with>
```

__Case__: Search and replace first occurrence in each line in whole file. In `Command` mode:

```vim
:%s/<regex-to-be-replaced>/<regex-to-replace-with>
```

__Case__: Search and replace all the occurrences. In `Command` mode:

```vim
:%s/<regex-to-be-replaced>/<regex-to-replace-with>/g
```

---

### 5) - Delete lines.

__Case__: Delete the current line. 

1) Press `dd`.
2) Or, In `Command` mode:

```vim
:d
```

__Case__: Delete 'n' lines from current. (Current line + 'n-1' following lines). In `Command` mode:

```vim
:d <n>
```

__Case__: Delete all lines in an entire file. In `Command` mode.

```vim
:%d
```

---

### 6) - Set (or Unset) flags after opening a file 'xyz'.

For example, you want to disallow 'write' and 'modify'. One way to do is to unset these flags while opening file:

```shell
vim -RM xyz
```

But since the file is already open, it can be changed here too. In `Command` mode, enter:

- `set nomodifiable` - to disallow modify.
- `set modifiable` - to allow modify.
- `set nowrite` - to disallow write.
- `set write` -  to allow write.

---