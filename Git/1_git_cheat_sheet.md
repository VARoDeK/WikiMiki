
---

| [Home](/README.md) | [Index](./README.md) | [Back](./README.md) | [Next](../Linux/README.md) |
| :---: | :---: | :---: | :---: |

---

# Git Cheat Sheet

### 1) - `$ git clone <repo-location>`
This will clone the repository from a particular location _(location can be a URL too)_. For ex:

```shell
git clone https://github.com/VARoDeK/MyNotes.git
```

---

### 2) - `$ git remote add <name-of-new-remote> <remote>`
To add a new remote. For ex:

```shell
git remote add varodek https://github.com/VARoDeK/newlib.git
```

Here, `varodek` is the name of remote and `https://github.com/VARoDeK/newlib.git` is the remote value, i.e. location.

---

### 3) - `$ git pull <remote-name> <branch-name>`

This will fetch and merge the commits from the mentioned branch of the mentioned remote. For ex:

```shell
git pull varodek newBranch1
```

This will sync you current branch with `newBranch1` branch of the remote `varodek`.

---

### 4) - `$ git push <remote-name> <branch-name>`
Similar to `git pull`, but this will sync the remote with your current branch. For ex:

```shell
git push varodek newBranch1
```

---

### 5) - `$ git checkout -b <branch-name>`
This will create a new branch and make this as your current. For ex:

```shell
git checkout -b newBranch2
```

This will create a new branch with name `newBranch2` and now your current working branch will be `newBranch2`.

---

### 6) - `$ git push --set-upstream <remote-name> <branch-name>`

Consider the case, you created a new branch in local repository. But now you cannot push it, as the remote repository does not have that branch. Hence, it does not know where to push the changes. So we use `--set-upstream` flag to do required. For ex:

```shell
git push --set-upstream varodek newBranch2
```

---

### 7) - `$ git add -A`
This will add all the changes, made after latest commit, to staging area. For ex:

```shell
git add -A
```

---

### 8) - `$ git checkout -f`
After adding changes to staging area, before commiting them, if you want to delte all changes and go back to previous commit. Use this command. For ex:

```shell
git checkout -f
```

---

### 9) - `$ git format-patch`
To create patch.

```
git fromat-patch -1
```

To Do

---

### 10) - `$ git send-email`
To send the patch through mail. For ex:

```
git send-email -1 -v4 --to=devel@rtems.org --cc=abcd1@xyz1 --cc=abcd2@xyz2
```

This will send email to `devel@rtems.org` and it will be cc'd to `abcd1@xyz1` and `abcd2@xyz2`.

---

### 11) - `$ git send-email --cover-letter`
To send the patch through mail and also include cover letter. For ex:

```
git send-email -1 -v4 --to=devel@rtems.org --cc=abcd1@xyz1 --cc=abcd2@xyz2 --cover-letter
```

This will send email to `devel@rtems.org` and it will be cc'd to `abcd1@xyz1` and `abcd2@xyz2`.

---

### 12) - `$ git reset --soft HEAD~<n>`
To delete the previous **n** commits, but don't delete the changes made. Instead the changes are bought to staging area. For ex:

```shell
git reset --soft HEAD~2
```

This will delete the last **2** commits of the current branch. All the chnages will be reflected in staging area. But in this case if you want push the changes, you need to do:

```shell
git push -f <remote-name> <branch-name>
```

---