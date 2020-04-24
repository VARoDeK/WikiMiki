
---

| [Home](/README.md) | [Index](./README.md) | [Back](./1_git_cheat_sheet.md) | [Next](../Linux/README.md) |
| :---: | :---: | :---: | :---: |

---

# Cover Letter with - `git send-email`

To see how to use `git send-email`, visit [here](./1_git_cheat_sheet.md#10----git-send-email).

---

## Option: `--cover-letter`
To include a cover letter in patch series.

Normally, when we create patch, for example

```
git format-patch -2
```

It means to create patches of last two commits. Here,

1) [PATCH 1/2] - Means second last commit.
2) [PATCH 2/2] - Means last commit.

But when we use `--cover-letter` option, it creates:

3) [PATCH 0/2] - For Cover Letter.

---

### 1) - `$ git format-patch --cover-letter`
To create patch series with a cover letter. For ex:

#### Step 1 : Create Patch-Series

```shell
git format-patch -2 -v2 --cover-letter -o ~/development/PATCH/linux
```

* `-o` : Patch where patch series will be saved.

Thus three files will be created inside `~/development/PATCH/linux`. You can edit the Cover letter there.

#### Step 2 : Send Patch-Series

```shell
git send-email --to-cover --cc-cover ~/development/PATCH/linux/*.patch
```
Now, when I edited cover letter, I included '__To :__' and '__Cc :__' in it.

* `--to-cover` : If this is set, emails found in To: headers in the first patch of the series (typically the cover letter) are added to the to list for each email set.

* `--cc-cover` : If this is set, emails found in Cc: headers in the first patch of the series (typically the cover letter) are added to the cc list for each email set.

---

### 1) - `$ git send-email --cover-letter`
To create patch series with a cover letter. For ex:

```shell
git send-email -2 -v1 --cover-letter --to="abc@xyz.com" --cc="def@xyz.com"
```

But this throws error:
```
# Refusing to send because the patch
# 	/tmp/ffNzhikwdO/v1-0000-cover-letter.patch
# has the template subject '*** SUBJECT HERE ***'. Pass --force if you really want to send.
```

So, use `--force` option.

```shell
git send-email -2 -v1 --cover-letter --to="abc@xyz.com" --cc="def@xyz.com" --force
```

Edit everything and send it.

---