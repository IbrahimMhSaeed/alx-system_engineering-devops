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
