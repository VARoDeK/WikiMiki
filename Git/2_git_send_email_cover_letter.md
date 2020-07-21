
---

| [Home](/README.md) | [Index](./README.md) | [Back](./1_git_cheat_sheet.md) | [Next](./3_git_rewrite_history.md) |
| :---: | :---: | :---: | :---: |

---

# Cover Letter with Patch-Series

To see how to use `git send-email`, visit [here](./1_git_cheat_sheet.md#10----git-send-email).

__Note: Anything wirtten after `#` is a comment. Even, terminal commands written after it are also comments. This may be used to display outputs in code blocks or to explain the usage of a commnd, in this case the output in your terminal will obviously will not contain `#`, it is just for presentation.__

---

## Option: `--cover-letter` to include a cover letter in patch series.

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

## There are 2 ways to send your patch-series with cover letter:

---

### 1) - `$ git format-patch --cover-letter`
To create patch series with a cover letter. For ex:

#### Step 1 : Create Patch-Series

```shell
git format-patch -3 -v2 --cover-letter -o ~/development/PATCH/linux
```

> Thus three files will be created inside `~/development/PATCH/linux`.

```shell
ls

# v2-0000-cover-letter.patch
# v2-0001-pcnet32-Convert-to-generic-power-management.patch
# v2-0002-amd8111e-Convert-to-generic-power-management.patch
# v2-0003-amd-xgbe-Convert-to-generic-power-management.patch
```

The cover letter looks like this:

```shell
vim v2-0000-cover-letter.patch

# From 5292d5c4bd0acb101dd2c2b47e131cc8650bb59c Mon Sep 17 00:00:00 2001
# From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
# Date: Mon, 22 Jun 2020 16:32:53 +0530
# Subject: [PATCH v2 0/3] *** SUBJECT HERE ***
#
# *** BLURB HERE ***
#
# Vaibhav Gupta (3):
#   pcnet32: Conver.....
```

You can edit the Cover letter there. You can also include "To:" and "CC:" in the cover letter, so you don't have to mention it in commandline while sending them. For ex:

```shell
# From 5292d5c4bd0acb101dd2c2b47e131cc8650bb59c Mon Sep 17 00:00:00 2001
# From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
# To: Bjorn Helgaas <helgaas@kernel.org>
# To: "David S. Miller" <davem@davemloft.net>
# Cc: netdev@vger.kernel.org
# Cc: linux-kernel@vger.kernel.org
# Date: Mon, 22 Jun 2020 16:32:53 +0530
# Subject: [PATCH v2 0/3] ethernet: amd: Convert to generic power management

# Linux Kernel
```
#### Step 2 : Send Patch-Series

```shell
git send-email --to-cover --cc-cover ~/development/PATCH/linux/*.patch
```
Now, when I edited cover letter, I included '__To :__' and '__Cc :__' in it.

* `--to-cover` : If this is set, emails found in To: headers in the first patch of the series (typically the cover letter) are added to the to list for each email set.

* `--cc-cover` : If this is set, emails found in Cc: headers in the first patch of the series (typically the cover letter) are added to the cc list for each email set.

---

### 2) - `$ git send-email --cover-letter`
To create patch series with a cover letter. For ex:

```shell
git send-email -2 -v1 --cover-letter --to="abc@xyz.com" --cc="def@xyz.com"
```

But this throws error:

```shell
# Refusing to send because the patch
# 	/tmp/ffNzhikwdO/v1-0000-cover-letter.patch
# has the template subject '*** SUBJECT HERE ***'. Pass --force if you really want to send.
```

So, use `--force` option.

```shell
git send-email -2 -v1 --cover-letter --to="abc@xyz.com" --cc="def@xyz.com" --force
```

It will ask for various options before sending it. Enter __`e`__ to edit the cover letter.
The editing of cover letter is similar as it was done in [1](#1----git-format-patch---cover-letter).

---
