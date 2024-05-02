# Shell, basics

## Basic concepts
**What is "the Shell"?**
is a program that takes commands from the keyboard and gives them to the operating system to perform.

**example of shell**:
- bash (Bourne Again SHell)
- zsh
- Tcsh
- ksh

**What's a "Terminal?"**
a program that opens a window and lets you interact with the shell.

**How to know if u are operating as the root?**
If the last character of your shell prompt is # rather than $, you are operating as the superuser.

## Navigation
command |function
--------|------------
cd |change working directory
pwd |print working directory
ls |list files and folders for specific directory

### Closer Look at `ls -ls`
```
-rw-------   1 me       me            576 Apr 17  2019 weather.txt
drwxr-xr-x   6 me       me           1024 Oct  9  2019 web_page
-rw-rw-r--   1 me       me         276480 Feb 11 20:41 web_site.tar
-rw-------   1 me       me           5743 Dec 16  2018 xmas_file.txt

----------     -------  -------  -------- ------------ -------------
    |             |        |         |         |             |
    |             |        |         |         |         File Name
    |             |        |         |         |
    |             |        |         |         +---  Modification Time
    |             |        |         |
    |             |        |         +-------------   Size (in bytes)
    |             |        |
    |             |        +-----------------------        Group
    |             |
    |             +--------------------------------        Owner
    |
    +----------------------------------------------   File Permissions
```
## Looking Around
command |function
--------|------------
cd |change working directory
pwd |print working directory
ls |list files and folders for specific directory
