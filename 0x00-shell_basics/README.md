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
less |lets us view text files
file |what kind of data a file contains before we try to view it
cp |copy files and directories
mv | move (rename) files
rm | remove files or directories
mkdir | make directories
type | Display information about command type.
help | Display information about builtin commands
which | shows the full path of (shell) commands.
man | an interface to the system reference manuals

## Wildcards

Wildcard	|Meaning
------------|----------
`*`	|Matches any characters
`?`	|Matches any single character
[characters]	|Matches any character that is a member of the set characters. The set of characters may also be expressed as a POSIX character class such as one of the following:POSIX Character Classes `[:alnum:]`	Alphanumeric characters `[:alpha:]`	Alphabetic characters `[:digit:]`	Numerals `[:upper:]`	Uppercase alphabetic characters `[:lower:]`	Lowercase alphabetic characters
`[!characters]`	|Matches any character that is not a member of the set characters

## What are "Commands?"
Commands can be one of 4 different kinds:
1. **An executable program** like all those files we saw in /usr/bin. Within this category, programs can be compiled binaries such as programs written in C and C++, or programs written in scripting languages such as the shell, Perl, Python, Ruby, etc.
2. **A command built into the shell itself.** bash provides a number of commands internally called shell builtins. The cd command, for example, is a shell builtin.
3. **A shell function.** These are miniature shell scripts incorporated into the environment. We will cover configuring the environment and writing shell functions in later lessons, but for now, just be aware that they exist.
4. **An alias.** Commands that we can define ourselves, built from other commands. This will be covered in a later lesson.

## add section about this
https://www.howtogeek.com/181/keyboard-shortcuts-for-bash-command-shell-for-ubuntu-debian-suse-redhat-linux-etc/

## Shebang (Unix)

is `(#!)`
When a text file with a shebang is used as if it is an executable in a Unix-like operating system, the program loader mechanism parses the rest of the file's initial line as an interpreter directive. The loader executes the specified interpreter program, passing to it as an argument the path that was initially used when attempting to run the script, so that the program may use the file as input data
