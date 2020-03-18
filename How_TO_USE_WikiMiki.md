# How To Use WikiMiki?

> The purpose is to keep it simple and smooth.

---

## 1) Every note may or may-not contain Code Block(s)

A code block can be a shell scrip/ commands too. 

For example, let's make a code-block to instruct, how to create a directory and go inside it? _(let's say your new directory name is `demo`)_

```shell
mkdir demo

cd demo
```

---

## 2) `$` - Distinguish Commands, present outside the code-block(s), from mono-spaced words.

Consider the following statement: 

"To remove the directory `demo`, just type `$ rm -rf demo` in your terminal."

Now, you can see that there 2 mono-spaced entities:
1) `demo` - It is a mono-spaced word.
2) `$ rm -rf demo` - It is a terminal command since `rm -rf demo` is written after `$` character, accompanied by one white-space.

---

## 3) Use of `#` character in Code-Blocks.

Anything wirtten after `#` is a comment. Even, terminal commands written after it are also comments. This may be used to display outputs in code blocks or to explain the usage of a commnd.

---