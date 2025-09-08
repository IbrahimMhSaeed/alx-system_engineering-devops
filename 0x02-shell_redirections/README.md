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
