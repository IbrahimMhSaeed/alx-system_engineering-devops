# I/O Redirection in Linux

I/O redirection allows programs to **send output somewhere other than the screen** and **receive input from somewhere other than the keyboard**.
This makes it possible to save results to files, feed commands from files, or chain multiple commands together.

---

## Standard Output (`>` and `>>`)

* **Principle:**
  By default, commands send their results to **standard output (stdout)**, which goes to the display.
  Using redirection, you can send stdout to a file instead.

```bash
# Redirect output to a file (overwrites file each time)
ls > file_list.txt  

# Append output to a file (keeps old content, adds new output)
ls >> file_list.txt
```

* `>` → overwrites the file.
* `>>` → appends to the file.
* If the file doesn’t exist, it will be created.

---

## Standard Input (`<`)

* **Principle:**
  By default, commands take input from **standard input (stdin)**, which is the keyboard.
  Redirection lets stdin come from a file instead.

```bash
# Read input from a file instead of keyboard
sort < file_list.txt  

# Redirect both input and output
sort < file_list.txt > sorted_file_list.txt
```

* `<` replaces the keyboard as input with a file.
* Output still goes to stdout unless redirected.
* Order of `<` and `>` doesn’t matter, but they must appear after options/arguments.

---

## Pipelines (`|`)

* **Principle:**
  A **pipeline** connects the stdout of one command directly to the stdin of another.
  This allows multiple commands to work together.

```bash
# Send ls output into less (for scrolling view)
ls -l | less
```

### Examples

```bash
ls -lt | head                     # Show 10 newest files
du | sort -nr                     # Show directories sorted by size
find . -type f -print | wc -l     # Count all files in current dir + subdirs
```

---

## Filters (Commands Used in Pipelines)

* **Principle:**
  A filter is a command that **takes input (stdin), processes it, and sends output (stdout)**.
  Filters can be combined in pipelines to perform powerful operations.

| Command | What it does                                   |
| ------- | ---------------------------------------------- |
| `sort`  | Sorts input.                                   |
| `uniq`  | Removes duplicates (requires sorted input).    |
| `grep`  | Finds lines matching a pattern.                |
| `fmt`   | Formats text into neat paragraphs.             |
| `pr`    | Splits text into pages with headers/footers.   |
| `head`  | Shows the first few lines.                     |
| `tail`  | Shows the last few lines.                      |
| `tr`    | Translates/replaces characters.                |
| `sed`   | Stream editor (advanced text transformations). |
| `awk`   | Programming language for text processing.      |

---

## Practical Examples

### Printing with Pipelines

```bash
# Format → paginate → print
cat poorly_formatted_report.txt | fmt | pr | lpr  

# Sort → remove duplicates → paginate → print
cat unsorted_list_with_dupes.txt | sort | uniq | pr | lpr
```

### Viewing tar Files

```bash
# View contents of a gzipped tar file
tar tzvf name_of_file.tar.gz | less
```

---

## ✅ Summary

* **Standard Output (stdout):**
  Goes to display by default → redirect with `>` (overwrite) or `>>` (append).

* **Standard Input (stdin):**
  Comes from keyboard by default → redirect with `<` from a file.

* **Pipelines (`|`):**
  Connect stdout of one command to stdin of another.

* **Filters:**
  Special commands that read from stdin, process data, and send results to stdout.

👉 Together, these principles allow Linux commands to work like **building blocks**, creating complex tasks by chaining simple commands.


---

# Bash Special Characters

In Bash, certain characters are **not interpreted literally**. Instead, they carry **special instructions** or **alternate meanings**. These are called **special characters** (or *meta-characters*).

They control how commands, input, output, and variables behave.

---

## Common Special Characters

| Character                                | Principle / Use                                                                                                                           |                                                             |
| ---------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------- |
| **Whitespace (` `, tab, newline, etc.)** | Separates words: the first word is the command, following words are arguments.                                                            |                                                             |
| **`$`**                                  | **Expansion** → Used for parameter expansion (`$var`), command substitution (`$(command)`), and arithmetic expansion (`$((expression))`). |                                                             |
| **`' '` (single quotes)**                | Everything inside is taken **literally** (no expansions, no special characters).                                                          |                                                             |
| **`" "` (double quotes)**                | Protects text from splitting into multiple arguments, but **still allows expansions**.                                                    |                                                             |
| **`\` (backslash)**                      | **Escape** character → makes the next character literal. Works outside quotes, inside double quotes, ignored inside single quotes.        |                                                             |
| **`#`**                                  | **Comment** → Everything after `#` on the line is ignored.                                                                                |                                                             |
| **`=`**                                  | **Assignment** → Sets variables (`logdir=/var/log/myprog`). No spaces allowed around `=`.                                                 |                                                             |
| **`[[ ]]`**                              | **Test expression** → Used for conditionals (string comparisons, file checks, etc.).                                                      |                                                             |
| **`!`**                                  | **Negation** → Reverses a test or command’s exit status.                                                                                  |                                                             |
| **`>`, `>>`, `<`**                       | **Redirection** → Redirect output or input to files.                                                                                      |                                                             |
| \*\*\`                                   | \`\*\*                                                                                                                                    | **Pipe** → Sends stdout of one command to stdin of another. |
| **`;`**                                  | **Command separator** → Run multiple commands on the same line.                                                                           |                                                             |
| **`{ }`**                                | **Inline group** → Treat multiple commands as one.                                                                                        |                                                             |
| **`( )`**                                | **Subshell group** → Run commands in a subshell (isolated environment).                                                                   |                                                             |
| **`(( ))`**                              | **Arithmetic expression** → Perform math, e.g., `(( a = 1 + 4 ))`.                                                                        |                                                             |
| **`$(( ))`**                             | **Arithmetic expansion** → Replaced with result of calculation, e.g., `echo $(( 5 + 5 ))`.                                                |                                                             |
| **`*`, `?`**                             | **Globs** → Wildcards for filename matching (`*.txt`, `file?.sh`).                                                                        |                                                             |
| **`~`**                                  | **Home directory** → Expands to user’s home dir (`~/Documents`).                                                                          |                                                             |
| **`&`**                                  | **Background execution** → Run command in background.                                                                                     |                                                             |

---

## Examples

```bash
# Expansion
echo "I am $LOGNAME"
# → I am lhunath

# Single vs double quotes
echo 'I am $LOGNAME'
# → I am $LOGNAME
echo "My computer is $(hostname)"
# → My computer is Lyndir

# Comment
# this is ignored

# Escaping
echo An open\ \ \ space
# → An open   space

# Redirection
echo boo > file

# Arithmetic
echo $(( 5 + 5 ))
# → 10
(( 5 > 0 )) && echo "Five is greater than zero."
# → Five is greater than zero.
```

---

## Deprecated Special Characters

These are recognized but **not recommended** (kept for backward compatibility):

| Character | Old Meaning               | Recommended Alternative |
| --------- | ------------------------- | ----------------------- |
| `` ` ` `` | Old command substitution  | Use `$(command)`        |
| `[ ]`     | Old test syntax (POSIX)   | Use `[[ ]]`             |
| `$[ ]`    | Old arithmetic expression | Use `$(( ))`            |

---

## ✅ Summary

* **Quoting**: `' '` = literal, `" "` = allows expansion, `\` = escape.
* **Expansion**: `$`, `$(( ))`, and `$( )` allow variables, math, and command substitution.
* **Redirection & pipes**: `>`, `>>`, `<`, `|` manage input/output flow.
* **Control**: `;`, `{ }`, `( )`, `&` control how and when commands run.
* **Globs & home**: `*`, `?`, `~` expand filenames and directories.
* **Comments**: `#` ignores the rest of the line.
