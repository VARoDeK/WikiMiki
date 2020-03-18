
---

| [Home](/README.md) | [Index](./README.md) | [Back](./Documentation/1_clone_and_build_docs_using_sphinx.md) | [Next](./2_project_sandboxing.md) |
| :---: | :---: | :---: | :---: |

---

# RTEMS has several Guidelines and Protocols, to be followed when contributing to it.

## 1) - New Branch for every Contribution.
* **Always make a new branch for each contribution/ change**. Suppose when I made a contribution to mention the installation of `pax` package, in rtems-docs; I made an another branch with name install_pax (`$ git checkout -b install_pax`).

---

## 2) - 80 Columns Format
* RTEMS community follows the rule of writing the content in **80 COLUMNS FORMAT**. That means while writing anything, **the number of characters do no exceed the count of 80**, in a line. 

* If you ever contribute to rtems-docs, make sure that the contents of Docs are written in **80 COLUMNS FORMAT**. That means **only 80 characters in a line**.

* Even the source codes of RTEMS are wriiten in 80 columns format.

* Even THE Git-commits are also written in 80 columns format.

* I noticed, that they are so much used to this, that even mails are also written in same format.

---
## 3) - Send email using Git

* To use `git send-email` , you need to go to your google account->security->allow third party apps to send email. ; As this is very volatile for security of your account, just allow it for the seconds you are using `git send-email`, then again switch it off.

---
