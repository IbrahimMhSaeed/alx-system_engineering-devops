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
