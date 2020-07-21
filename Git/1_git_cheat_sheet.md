
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

This will sync you current branch with `newBranch1` branch of the remote `varodek` and make an additional commit concluding all the changes.

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

You can also use short form : `-u`

```shell
git push -u varodek newBranch2
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

### 13) - `$ git merge <branch name>`

Suppose you are on branch __"development"__ . And you run:

```shell
git merge master
```

The following happens:

1) - git will find common ancestor commit of "development" and "master".

2) - git will take all the commits made on "master" since the common ancestor commit.

3) - It will put the changes on top of your branch and make an additional commit to reflect the changes.

```
  Before rebase         After rebase
    e-f-g development     e-f-g-H development
   /                     /     /
  a-b-c-d master        a-b-c-d master
```

---

### 14) - `$ git rebase <branch name>`

Suppose you are on branch __"development"__. And you run:

```shell
git rebase master
```

The following happens:

1) - git will find common ancestor commmit of "development" and "master".

2) - git will buffer the commits made on "development" since the common ancestor commit. Hene the latest commit of "development" is the common ancestor commit. (This doesn't probably happens, it is just to explain).

3) - git will sync "master" and "development". Hence, "development" and "master" are true mirror of each other.

4) - Now, git will re-apply the buffered commits on top of "development".

```
  Before rebase         After rebase
    e-f-g development           E-F-G development
   /                           /
  a-b-c-d master        a-b-c-d master
```

---

### 15) - `$ git pull --rebase <remote-name> <branch-name>`

It will fetch the changes from upstream and rebase your local changes.

Consider the case:
1) I fork a repo.
2) I make changes and now my fork-repo is one commit ahead of original.
3) I create a Pull-Request, the author accepts it and an additional commit, for merging, goes on top of my commit.
4) Now if I do `git pull origin master` in my fork-repo (origin refers to repo of original author), the commits will be fetched from origin-master and will be saved in my fork-repo with an additional commit for pull-merge. Hence, again my fork-repo is one commit ahead of original. And this loop will continue.
5) But if I do `git pull --rebase origin master` in Step-4, the commits will be fetched from origin and will be saved in my fork-repo. No additional commit will be made for pulling changes. Thus my fork-repo got synced with original.

For ex:

```shell
git pull --rebase origin master
```

This will sync you current branch with `master` branch of the remote `origin`.

---

### 16) - `$ git log --grep="<regex>"`

Consider a case where I want to search some text/regular-expression in previous commits. 
`git log --grep` will search git commits with regular expression. You can attach several flags:

1) `--no-merges` - It won't show merge commits.
2) `--oneline` - It will show only commit headersFor ex:

```shell
git log --all --grep="drivers/net/ethernet/realtek" --no-merges --oneline
```
3) `--all` - It will search in all branches.

I use:

```shell
git log --grep="<regex>" --full-diff --all --no-merges
```

---

### 17) - `$ git commit --amend`

It is used to modify/update your previous commit.

```
  Before amend           After amend

  a-b-c-d master         a-b-c-D master

```

Use when:
  - want to update/add/delete/create a file in previous commit.
  - want to update/modify commit message.

Example:

```shell
git commit --amend
```

---
