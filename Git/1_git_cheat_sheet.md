
---

| [Home](/README.md) | [Index](./README.md) | [Back](./README.md) | [Next](./2_git_send_email_cover_letter.md) |
| :---: | :---: | :---: | :---: |

---

# Git Cheat Sheet

### 1) - `$ git clone <repo-location>`

__Case__ : You want to clone a repository from a particular location _(location can be a URL too)_. For ex:

```shell
git clone https://github.com/VARoDeK/WikiMiki.git
```

__Case__ : You want clone only latest version. i.e. You don't want a full commit history, just the latest code. It is known as shallow repository.

```shell
git clone --depth 1 https://github.com/VARoDeK/WikiMiki.git
```

__Case__ : You want to clone a shallow repositoy at specific branch/tag.

```shell
git clone --depth 1 -b v5.10.65-rt53-rebase git://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git
```

---

### 2) - `$ git remote add <name-of-new-remote> <remote>`

__Case__ : You want to add a new remote _(remote is the pointer to location)_. For ex:

```shell
git remote add varodek https://github.com/VARoDeK/newlib.git
```

Here, `varodek` is the name of remote and `https://github.com/VARoDeK/newlib.git` is the remote value, i.e. location.

---

### 3) - `$ git pull <remote-name> <branch-name>`

__Case__ : You want to fetch and merge the commits from the mentioned branch of the mentioned remote. For ex:

```shell
git pull varodek newBranch1
```

This will collect changes from the mentioned branch of the mentioned remote and add them on the top of your branch in the form of a commit. The changes will but put on the top of your local changes/commits if you have any.

If you want to rebase it, check [here](#15----git-pull---rebase-remote-name-branch-name).

---

### 4) - `$ git push <remote-name> <branch-name>`

__Case__ : You want send your changes to the remote. This is similar to `git pull`, but this will sync the remote with your current branch. For ex:

```shell
git push varodek newBranch1
```

__Case__ : The repository is very big and you want push entire repository to the remote. But you get errors like:

  * `fatal: The remote end hung up unexpectedly`
  * `remote: fatal: pack exceeds maximum allowed size`

In this case, you cannot send all commits in one go, you will have to break it into pieces. Use [this solution](https://github.com/git-lfs/git-lfs/issues/3758#issuecomment-519111398).

```shell
git rev-list --reverse master | ruby -ne 'i ||= 0; i += 1; puts $_ if i % 20000 == 0' | xargs -I{} git push varodek +{}:refs/heads/master
```

Thie above command will send 20000 commits at a time. You can change the value.

---

### 5) - `$ git checkout -b <branch-name>`

__Case__ : You want to create a new branch from the HEAD of your current branch. Do:

```shell
git checkout -b newBranch2
```

This will create a new branch with name `newBranch2` and now your current working branch will be `newBranch2`.

__Case__ : You want to create a new branch for a tag. In-short, there is a tag in your tree, you want to create a new branch with tag being the head.

```shell
git checkout tags/v5.10.65-rt53-rebase -b new_branch
```

---

### 6) - `$ git push --set-upstream <remote-name> <branch-name>`

__Case__ : You created a new branch in local repository. But now you cannot push it, as the remote repository does not have that branch. Hence, it does not know where to push the changes. So we use `--set-upstream` flag to do required. For ex:

```shell
git push --set-upstream varodek newBranch2
```

You can also use short form : `-u`

```shell
git push -u varodek newBranch2
```

---

### 7) - `$ git add -A`

__Case__ : You want to add all the changes, made after latest commit, to staging area. For ex:

```shell
git add -A
```

---

### 8) - `$ git checkout -f`

__Case__ : After adding changes to staging area, before commiting them, if you want to delete all changes and go back to previous commit. Use this command. For ex:

```shell
git checkout -f
```

---

### 9) - `$ git format-patch`

__Case__ : You want to create a patch _(or a patch-series)_. Then send it.

```shell
git fromat-patch -<N> -v<n>
```

1) `N` - To tell the number of top-most commits you want to include in your patch-series.

2) `n` - To tell the version number of the patch(es). Sometime you are suggested some changes in your patches and are asked to resend it. Version numbering simplifies it.

```shell
git fromat-patch -2 -v1
```

> Here, the patch will have last 2 commits. And it is the 1st version of the patch.
> Remeber, one patch is created per commit. Thus, 2 patch files will be created.

__Case__ : You want to save created patches at a particular location.

Use `-o` flag to tell the location to save patches:

```shell
git format-patch -2 -v1 -o ~/development/PATCH/linux
```

__Case__ : You want to create patch-series for the changes from last x<sup>th</sup> commit to last y<sup>th</sup> commit.

For example you want a patch-series from last 5<sup>th</sup> commit to last 2<sup>nd</sup> commit. Now last 2<sup>nd</sup> commit is `HEAD~1` and last 5<sup>th</sup> commit is `HEAD~4`. But we will have to use `HEAD~5` as the revision number in the left is not included in the count. Therefore, the command will be:

```shell
git format-patch HEAD~5..HEAD~1 -v1 -o ~/development/PATCH/linux
```

And use this to send those patches:

```shell
git send-email --to=linux-kernel@vger.kernel.org --cc=abcd1@xyz1 --cc=abcd2@xyz2 ~/development/PATCH/linux/*.patch
```

This will send email to `devel@rtems.org` and it will be cc'd to `abcd1@xyz1` and `abcd2@xyz2`.

---

### 10) - `$ git send-email`

__Case__ : You want to create-send the patch through mail. For ex:

```shell
git send-email -<N> -v<n> --to=devel@rtems.org --cc=abcd1@xyz1 --cc=abcd2@xyz2
```

Ex:

```shell
git send-email -4 -v2 --to=devel@rtems.org --cc=abcd1@xyz1 --cc=abcd2@xyz2
```

Here, the patch will have last 4 commits. And it is the 2nd 
This will send email to `devel@rtems.org` and it will be cc'd to `abcd1@xyz1` and `abcd2@xyz2`.

---

### 11) - `--cover-letter`

__Case__ : You want to send the patch through mail and also include cover letter. For ex:

See brief description [here](./2_git_send_email_cover_letter.md).

---

### 12) - `$ git reset --soft HEAD~<n>`

__Case__ : You want to delete the previous **n** commits, but don't delete the changes made. Instead the changes are bought to staging area. For ex:

```shell
git reset --soft HEAD~2
```

This will delete the last **2** commits of the current branch. All the chnages will be reflected in staging area. But in this case if you want push the changes, you need to do:

```shell
git push -f <remote-name> <branch-name>
```

Use `--hard` instead of `--soft` if you want to completely remove **n** commits.

---

### 13) - `$ git merge <branch name>`

__Case__ : Suppose you are on branch __"development"__ . And you run:

```shell
git merge master
```

The following happens:

1) - git will find common ancestor commit of "development" and "master".

2) - git will take all the commits made on "master" since the common ancestor commit.

3) - It will put the changes on top of your branch and make an additional commit to reflect the changes.

```
  Before merge          After merge
    e-f-g development     e-f-g-N development
   /                     /       \
  a-b-c-d master        a--b--c---d master
```

__`N`__ is the new merge commit, made.

---

### 14) - `$ git rebase <branch name>`

__Case__ : Suppose you are on branch __"development"__. And you run:

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

Understand [rebase](#14----git-rebase-branch-name) first.

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

__Case__ : Consider a case where you want to search some text/regular-expression in previous commits. 
`git log --grep` will search git commits with regular expression. You can attach several flags:

1) `--no-merges` - It won't show merge commits.
2) `--oneline` - It will show only commit headers. For ex:

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

__Case__ : You want to modify/update your previous commit.

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

### 18) - `$ git log --author=<email-ID>`

__Case__ : You want to search the commits, made by a particular developer.

For example, you want to search commits made by "vaibhavgupta40@gmail.com".

```shell
git log --author=vaibhavgupta40@gmail.com
```

---

### 19) - `$ git log --follow -- <full-filename>`

__Case__ : You want to search whole commit history of a particular file, even if the location of the file was changed, or file was renamed. In short, whatever happened with this files, it will show whole history.

__Note__, the `<full-filename>` should be the last option passed to `git` after `--`.

For example, you want to see the commit history of `atyfb_base.c` file in Linux Repo. It's current locations is `drivers/video/fbdev/aty/atyfb_base.c`.

```shell
git log --follow -- drivers/video/fbdev/aty/atyfb_base.c
```

---

### 20) - `$ git log --all --full-diff --no-merges --grep=<pattern-to-search>`

__Case__ : You want to search some commit on the basis of its contents/changes.

---

### 21) - `git log --no-merges -S<string> {`

__Case__ : I want a list of all commits where the given `<string>` was mentioned in the diff.

For example, I want to see the changes made to definition of `struct timeval` (if it is moved between files). The structure definitions are of the form `struct <structure-name> {` in the linux kernel source code. Thus, every commit where the string `struct timeval {` is present in the diff, is of my help.

```shell
git log --no-merges -Sstruct\ timeval\ {
```

__Note__, I know the same could be achieved with `git blame`, but this example is just to show the use-case.

---

### 22) - `git log --no-merges -L :<funcname>:<file>`

__Case__ : You want to see the list commits that modified a particular function (`<funcname>`) in a particular file (`<file>`).

For example, I want to see all the changes made to function `readl` in `include/asm-generic/io.h`

```shell
git log --no-merges -L :readl:include/asm-generic/io.h
```

---

### 23) - `git log --no-merges -L x,y:<file>`

__Case__ : You want to see the list of commits that modified the contents between line number x and line number y, in a particular file.

For example, I want to see all the changes made between line number 10 and 25 in `include/linux/timer.h`.

```shell
git log --no-merges -L 10,25:include/linux/timer.h
```

---

### 24) - `git diff <branch1/commit1/tag1> <branch2/commit2/tag2> -- <filename>`

__Case__ : You want to see the changes done to a file between two commits, or branches, or tags.

For example, I want to see all the changes made to Makefile between v5.10 and v4.9

```shell
git diff v5.10 v4.9 Makefile
```

---
