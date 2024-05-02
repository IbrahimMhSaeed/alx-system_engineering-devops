# Loops, conditions and parsing

## The for loop

`for NAME [in LIST ]; do COMMANDS; done`

### Examples
```
[carol@octarine ~/articles] ls *.xml
file1.xml  file2.xml  file3.xml

[carol@octarine ~/articles] ls *.xml > list

[carol@octarine ~/articles] for i in `cat list`; do cp "$i" "$i".bak ; done

[carol@octarine ~/articles] ls *.xml*
file1.xml  file1.xml.bak  file2.xml  file2.xml.bak  file3.xml  file3.xml.bak
```
## Operators

### assignment
**variable assignment:**
works for both arithmetic and string assignments.
```
var=27
category=minerals  # No spaces allowed after the "=".
```

### arithmetic operators

+
plus

-
minus

*
multiplication

/
division

**
exponentiation

```
let "z=5**3"    # 5 * 5 * 5
echo "z = $z"   # z = 125

```
%
modulus
*how to use single expressions*
```
bash$ expr 5 % 3
2
```
+=
plus-equal (increment variable by a constant) [1]

let "var += 5" results in var being incremented by 5.

-=
minus-equal (decrement variable by a constant)

*=
times-equal (multiply variable by a constant)

let "var *= 4" results in var being multiplied by 4.

/=
slash-equal (divide variable by a constant)

%=
mod-equal (remainder of dividing variable by a constant)
++
--

### bitwise operators
<<
bitwise left shift (multiplies by 2 for each shift position)

<<=
left-shift-equal

let "var <<= 2" results in var left-shifted 2 bits (multiplied by 4)

>>
bitwise right shift (divides by 2 for each shift position)

>>=
right-shift-equal (inverse of <<=)

&
bitwise AND

&=
bitwise AND-equal

|
bitwise OR

|=
bitwise OR-equal

~
bitwise NOT

^
bitwise XOR

^=
bitwise XOR-equal

logical (boolean) operators

!
NOT
```
if [ ! -f $FILENAME ]
then
  ...
```
&&
AND
```
if [ $condition1 ] && [ $condition2 ]
#  Same as:  if [ $condition1 -a $condition2 ]
#  Returns true if both condition1 and condition2 hold true...

if [[ $condition1 && $condition2 ]]    # Also works.
#  Note that && operator not permitted inside brackets
#+ of [ ... ] construct.
```
Note	
&& may also be used, depending on context, in an and list to concatenate commands.

||

,
comma operator
chains together two or more arithmetic operations.
```
let "t1 = ((5 + 3, 7 - 1, 15 - 4))"
echo "t1 = $t1"           ^^^^^^  # t1 = 11
# Here t1 is set to the result of the last operation. Why?

let "t2 = ((a = 9, 15 / 3))"      # Set "a" and calculate "t2".
echo "t2 = $t2    a = $a"         # t2 = 5    a = 9
```
The comma operator
chains together two or more arithmetic operations
```
let "t1 = ((5 + 3, 7 - 1, 15 - 4))"
echo "t1 = $t1"           ^^^^^^  # t1 = 11
# Here t1 is set to the result of the last operation. Why?

let "t2 = ((a = 9, 15 / 3))"      # Set "a" and calculate "t2".
echo "t2 = $t2    a = $a"         # t2 = 5    a = 9
```
## Other Comparison Operators

A binary comparison operator compares two variables or quantities. Note that integer and string comparison use a different set of operators.

### integer comparison

-eq
is equal to

if [ "$a" -eq "$b" ]

-ne
is not equal to

if [ "$a" -ne "$b" ]

-gt
is greater than

if [ "$a" -gt "$b" ]

-ge
is greater than or equal to

if [ "$a" -ge "$b" ]

-lt
is less than

if [ "$a" -lt "$b" ]

-le
is less than or equal to

if [ "$a" -le "$b" ]

<
is less than (within double parentheses)

(("$a" < "$b"))

<=
is less than or equal to (within double parentheses)

(("$a" <= "$b"))

>
is greater than (within double parentheses)

(("$a" > "$b"))

>=
is greater than or equal to (within double parentheses)

(("$a" >= "$b"))

### string comparison

=

is equal to

if [ "$a" = "$b" ]

Caution	
Note the whitespace framing the =.

if [ "$a"="$b" ] is not equivalent to the above.

==
is equal to

if [ "$a" == "$b" ]

This is a synonym for =.

Note	
The == comparison operator behaves differently within a double-brackets test than within single brackets.
```
[[ $a == z* ]]   # True if $a starts with an "z" (pattern matching).
[[ $a == "z*" ]] # True if $a is equal to z* (literal matching).

[ $a == z* ]     # File globbing and word splitting take place.
[ "$a" == "z*" ] # True if $a is equal to z* (literal matching).

# Thanks, Stéphane Chazelas
```
!=
is not equal to

if [ "$a" != "$b" ]

This operator uses pattern matching within a [[ ... ]] construct.

<
is less than, in ASCII alphabetical order

if [[ "$a" < "$b" ]]

if [ "$a" \< "$b" ]

Note that the "<" needs to be escaped within a [ ] construct.

>
is greater than, in ASCII alphabetical order

if [[ "$a" > "$b" ]]

if [ "$a" \> "$b" ]

Note that the ">" needs to be escaped within a [ ] construct.

See Example 27-11 for an application of this comparison operator.

-z
string is null, that is, has zero length

 String=''   # Zero-length ("null") string variable.

if [ -z "$String" ]
then
  echo "\$String is null."
else
  echo "\$String is NOT null."
fi     # $String is null.

-n
string is not null.

Caution	
The -n test requires that the string be quoted within the test brackets. Using an unquoted string with ! -z, or even just the unquoted string alone within test brackets (see Example 7-6) normally works, however, this is an unsafe practice. Always quote a tested string

### compound comparison

-a
logical and

exp1 -a exp2 returns true if both exp1 and exp2 are true.

-o
logical or

exp1 -o exp2 returns true if either exp1 or exp2 is true.

These are similar to the Bash comparison operators && and ||, used within double brackets.
```
[[ condition1 && condition2 ]]
```
The -o and -a operators work with the test command or occur within single test brackets.
```
if [ "$expr1" -a "$expr2" ]
then
  echo "Both expr1 and expr2 are true."
else
  echo "Either expr1 or expr2 is false."
fi
```

#### Example 7-6. Testing whether a string is null
```
#!/bin/bash
#  str-test.sh: Testing null strings and unquoted strings,
#+ but not strings and sealing wax, not to mention cabbages and kings . . .

# Using   if [ ... ]

# If a string has not been initialized, it has no defined value.
# This state is called "null" (not the same as zero!).

if [ -n $string1 ]    # string1 has not been declared or initialized.
then
  echo "String \"string1\" is not null."
else  
  echo "String \"string1\" is null."
fi                    # Wrong result.
# Shows $string1 as not null, although it was not initialized.

echo

# Let's try it again.

if [ -n "$string1" ]  # This time, $string1 is quoted.
then
  echo "String \"string1\" is not null."
else  
  echo "String \"string1\" is null."
fi                    # Quote strings within test brackets!

echo

if [ $string1 ]       # This time, $string1 stands naked.
then
  echo "String \"string1\" is not null."
else  
  echo "String \"string1\" is null."
fi                    # This works fine.
# The [ ... ] test operator alone detects whether the string is null.
# However it is good practice to quote it (if [ "$string1" ]).
#
# As Stephane Chazelas points out,
#    if [ $string1 ]    has one argument, "]"
#    if [ "$string1" ]  has two arguments, the empty "$string1" and "]" 


echo


string1=initialized

if [ $string1 ]       # Again, $string1 stands unquoted.
then
  echo "String \"string1\" is not null."
else  
  echo "String \"string1\" is null."
fi                    # Again, gives correct result.
# Still, it is better to quote it ("$string1"), because . . .


string1="a = b"

if [ $string1 ]       # Again, $string1 stands unquoted.
then
  echo "String \"string1\" is not null."
else  
  echo "String \"string1\" is null."
fi                    # Not quoting "$string1" now gives wrong result!

exit 0   # Thank you, also, Florian Wisser, for the "heads-up".
```

#### Example 7-5. Arithmetic and string comparisons
```
#!/bin/bash

a=4
b=5

#  Here "a" and "b" can be treated either as integers or strings.
#  There is some blurring between the arithmetic and string comparisons,
#+ since Bash variables are not strongly typed.

#  Bash permits integer operations and comparisons on variables
#+ whose value consists of all-integer characters.
#  Caution advised, however.

echo

if [ "$a" -ne "$b" ]
then
  echo "$a is not equal to $b"
  echo "(arithmetic comparison)"
fi

echo

if [ "$a" != "$b" ]
then
  echo "$a is not equal to $b."
  echo "(string comparison)"
  #     "4"  != "5"
  # ASCII 52 != ASCII 53
fi

# In this particular instance, both "-ne" and "!=" work.

echo

exit 0
```
## 7.2. File test operators

Returns true if...

-e
file exists

-f
file is a regular file (not a directory or device file)

-s
file is not zero size

-d
file is a directory

-b
file is a block device

-c
file is a character device

*use this link to check the rest:*
https://tldp.org/LDP/abs/html/fto.html
```
device0="/dev/sda2"    # /   (root directory)
if [ -b "$device0" ]
then
  echo "$device0 is a block device."
fi

# /dev/sda2 is a block device.



device1="/dev/ttyS1"   # PCMCIA modem card.
if [ -c "$device1" ]
then
  echo "$device1 is a character device."
fi

# /dev/ttyS1 is a character device.
```
## Make Linux/Unix Script Portable With #!/usr/bin/env As a Shebang

The env command allows to run a program in a modified environment. First, find line
```
#!/bin/bash
```
Replace with
```
#!/usr/bin/env bash
```
The advantage of #!/usr/bin/env bash is that it will use whatever bash executable appears first in the running user’s $PATH variable.

```
#!/usr/bin/env bash
x=5
y=10
echo "$x and $y"
```
Python Example
```
#!/usr/bin/env python
x=10
y=20
z=x+y
print z
```

## env
In Unix, the `env` command is used to display or modify the environment variables for a given command or script. The environment variables are dynamic values that affect the behavior of programs and processes on the Unix system.

Here is a summary of how the `env` command works in Unix:

- The `env` command allows you to run a command or script with a modified environment by specifying environment variables before the command.
- When you execute the `env` command followed by a command or script, it creates a new environment and executes the specified command within that environment.
- By using the `-i` option with `env`, you can start with an empty environment, meaning no environment variables are inherited from the current shell.
- Environment variables are typically set using the syntax `variable=value`. For example, `env VAR=value command` sets the environment variable `VAR` to the value `value` and then executes the `command`.
- If you want to display the current environment variables, you can simply run `env` without any arguments. It will list all the variables and their values.
- The `env` command can be useful when you want to override specific environment variables temporarily for a particular command or script. It allows you to provide a different value for an environment variable without permanently modifying the system-wide settings.

Here is an example usage of the `env` command:

```
env VAR=value command
```

In this example, `VAR` is an environment variable that is set to the value `value`, and then the `command` is executed within that modified environment.

Note: The specific behavior and options of the `env` command may vary slightly depending on the Unix variant or shell being used.

## `cut` Command

The `cut` command in Unix is used to extract specific sections (columns) from lines of input based on a delimiter. It allows you to select and manipulate specific fields from files or input streams. Here's a summary of how it works:

```bash
cut OPTION... [FILE]...
```

Examples:

1. Extract the second field from a file delimited by a space:
   ```bash
   cut -d' ' -f2 file.txt
   ```

   This command extracts the second field from each line of `file.txt` using a space as the delimiter.

2. Extract characters 3-7 from each line of a file:
   ```bash
   cut -c3-7 file.txt
   ```

   This command extracts characters 3 to 7 from each line of `file.txt`.

3. Extract fields 1 and 3 from a file delimited by a comma:
   ```bash
   cut -d',' -f1,3 file.csv
   ```

   This command extracts the first and third fields from each line of `file.csv` using a comma as the delimiter.

## `for` Loop

The `for` loop is a control structure in Unix that allows you to iterate over a list of items and perform a set of commands for each item. It has the following syntax:

```bash
for VAR in LIST
do
  # Commands to be executed
done
```

Examples:

1. Iterate over a list of filenames and print each filename:
   ```bash
   for file in file1.txt file2.txt file3.txt
   do
     echo $file
   done
   ```

   This loop iterates over the filenames `file1.txt`, `file2.txt`, and `file3.txt` and prints each filename.

2. Iterate over a range of numbers and print each number:
   ```bash
   for num in {1..5}
   do
     echo $num
   done
   ```

   This loop iterates over the range of numbers from 1 to 5 and prints each number.

## `while` Loop

The `while` loop is a control structure in Unix that repeatedly executes a set of commands as long as a specified condition is true. It has the following syntax:

```bash
while CONDITION
do
  # Commands to be executed
done
```

Examples:

1. Print numbers from 1 to 5 using a `while` loop:
   ```bash
   num=1
   while [ $num -le 5 ]
   do
     echo $num
     num=$((num + 1))
   done
   ```

   This loop prints numbers from 1 to 5 by incrementing the `num` variable in each iteration.

2. Read lines from a file and process each line using a `while` loop:
   ```bash
   while IFS= read -r line
   do
     echo "Processing: $line"
   done < file.txt
   ```

   This loop reads lines from `file.txt` and processes each line by echoing a message with the line content.

## `until` Loop

The `until` loop is a control structure in Unix that repeatedly executes a set of commands until a specified condition becomes true. It has the following syntax:

```bash
until CONDITION
do
  # Commands to be executed
done
```

Examples:

1. Print numbers from 1 to 5 using an `until` loop:
   ```bash
   num=1
   until [ $num -gt 5 ]
   do
     echo $num
     num=$((num + 1))
   done
   ```

   This loop prints numbers from 1 to 5 by incrementing the `num` variable in each iteration until `num` becomes greater than 5.

2. Read lines from a file and process each line using an `until` loop:
   ```bash
   until [ -z "$line" ]
   do
     read -r line
     echo "Processing: $line"
   done < file.txt
   ```

   This loop reads lines from `file.txt` and processes each line by echoing a message with the line content until an empty line is encountered (`-z "$line"` condition).

Certainly! Here's an expanded section on control structures in Unix, including `if`, `else`, `elif`, and `case` statements:

## `if` Statement

The `if` statement is a conditional control structure in Unix that allows you to perform different actions based on certain conditions. It has the following syntax:

```bash
if CONDITION
then
  # Commands to be executed if the condition is true
else
  # Commands to be executed if the condition is false
fi
```

Examples:

1. Check if a number is greater than 10 using an `if` statement:
   ```bash
   num=15
   if [ $num -gt 10 ]
   then
     echo "Number is greater than 10"
   else
     echo "Number is not greater than 10"
   fi
   ```

   This condition checks if the variable `num` is greater than 10. If true, it prints "Number is greater than 10"; otherwise, it prints "Number is not greater than 10".

2. Check multiple conditions using `elif`:
   ```bash
   num=5
   if [ $num -gt 10 ]
   then
     echo "Number is greater than 10"
   elif [ $num -eq 10 ]
   then
     echo "Number is equal to 10"
   else
     echo "Number is less than 10"
   fi
   ```

   This example checks if the variable `num` is greater than 10, equal to 10, or less than 10, and prints the corresponding message.

## `case` Statement

The `case` statement is another conditional control structure in Unix that allows you to perform different actions based on multiple conditions. It has the following syntax:

```bash
case VARIABLE in
  PATTERN1)
    # Commands to be executed if PATTERN1 matches
    ;;
  PATTERN2)
    # Commands to be executed if PATTERN2 matches
    ;;
  *)
    # Commands to be executed if no pattern matches
    ;;
esac
```

Examples:

1. Check the value of a variable using a `case` statement:
   ```bash
   fruit="apple"
   case $fruit in
     "apple")
       echo "It's an apple"
       ;;
     "banana")
       echo "It's a banana"
       ;;
     *)
       echo "It's neither an apple nor a banana"
       ;;
   esac
   ```

   This example checks the value of the variable `fruit` and prints the corresponding message based on the matching pattern.

2. Use pattern matching with wildcards:
   ```bash
   file="document.txt"
   case $file in
     *.txt)
       echo "It's a text file"
       ;;
     *.jpg|*.png)
       echo "It's an image file"
       ;;
     *)
       echo "It's neither a text file nor an image file"
       ;;
   esac
   ```

   This example uses wildcard patterns to match different file extensions and prints the corresponding message.

## How to Create SSH Keys

SSH keys provide a secure and convenient way to authenticate and connect to remote servers. This guide will walk you through the process of creating SSH keys on a Unix-like system.

1. Open a terminal: Launch a terminal application on your Unix-like system. This could be the default terminal emulator or a third-party application.

2. Generate the SSH key pair: In the terminal, use the `ssh-keygen` command to generate the SSH key pair. By default, this command generates an RSA key pair, but you can also specify a different type of key if desired. For example, to generate an RSA key pair, enter the following command:

   ```bash
   ssh-keygen -t rsa
   ```

   You can also specify the desired key size using the `-b` option. The default key size is 2048 bits. For example, to generate an RSA key pair with a key size of 4096 bits, you can use the following command:

   ```bash
   ssh-keygen -t rsa -b 4096
   ```

   The `ssh-keygen` command will prompt you for a file name to save the key pair to and an optional passphrase. Press Enter to accept the default file name and location, or specify a different file name and path if needed. You can also choose to set a passphrase for additional security, but it's optional.

   For example, the following prompt will appear:

   ```
   Enter file in which to save the key (/home/yourusername/.ssh/id_rsa):
   ```

   Press Enter to accept the default file name and location.

   If you choose to set a passphrase, you will be prompted to enter it twice.

3. View the generated keys: After generating the SSH key pair, you can view the files in the specified file location. By default, the private key is saved as `id_rsa` and the public key as `id_rsa.pub` in the `.ssh` directory of your home folder (`~/.ssh/`).

   To view the files, you can use the `ls` command:

   ```bash
   ls ~/.ssh/
   ```

   This will list the contents of the `.ssh` directory and display the generated key files.

4. Use the SSH keys: The private key (`id_rsa`) should be kept secure and not shared with anyone. The corresponding public key (`id_rsa.pub`) can be copied to the remote servers you want to connect to.

   To copy the public key to a remote server, you can use the `ssh-copy-id` command followed by the username and the hostname or IP address of the remote server. For example:

   ```bash
   ssh-copy-id username@remote-host
   ```

   This command will prompt you for the password of the remote user account. After entering the password, the public key will be securely copied to the remote server and added to the authorized keys file.

   Once the public key is added to the remote server, you can connect to it without being prompted for a password when using the corresponding private key.

   To connect to a remote server using SSH, you can use the `ssh` command followed by the username and the hostname or IP address of the remote server. For example:

   ```bash
   ssh username@remote-host
   ```

   If you set a passphrase for the private key, you will be prompted to enter it before establishing the SSH connection.

That's it! You have successfully created SSH keys and can now use them for secure and passwordless authentication when connecting to remote servers. Remember to keep your private key secure and avoid sharing it with unauthorized individuals.
