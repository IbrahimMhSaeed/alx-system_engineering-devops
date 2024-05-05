# Regular Expression

A regular expression, commonly called a “regexp”, is a sequence of characters that define a search pattern.  It is mainly for use in pattern matching with strings, or string matching (i.e. it operates like a “find and replace” command). While it is a very powerful tool, it is also very dangerous because of its complexity.

*Note:*
*One thing you have to be careful with is that different languages use different regexp engines. That means that a regexp in Python, for example, will be interpreted differently in Javascript:*

programming concept that appear in many programming languages (Python, php, etc...)
Specially if u want to check for validity of:
- Email
    - ibrahim@gmail.com
    - Valid emails have special patterns that distinguish them
    - Very hard to recognize using if conditions
- Phone numbers
- URLs, etc.....

## Regular Expression Syntax
```javascript
/pattern/[modifier(s)]
new RegExp("pattern", "modifier(s)")
// Last method not recommended
let regex = /elzero/ig
```

## Midifiers (flags)

Modifiers define how to perform the seach:

Modifier |Description
---------- |-----------
/g |Perform a global match (find all)
/i |Perform case-insensitive matching
/m |Perform multiline matching

## Brackets

Brackets are used to find a range of characters:

Bracket |Description
----------|-------------
[abc] |Find any character between the brackets
[^abc] |Find any character NOT between the brackets
[0-9] |Find any character between the brackets (any digit)
[^0-9] |Find any character NOT between the brackets (any non-digit)
(x\|y) |Find any of the alternatives specified

```javascript
mystr.match(pattern)
let mystr = "hello elzero I love Elzero"
let regex = /Elzero/

mystr.match(regex)
// Return Elzero at index (its index)

let regex = /Elzero/i
mystr.match(regex)
// Return elzero at index (its index) 
// Just get first element

let regex = /Elzero/ig
mystr.match(regex)
// Return both elzero & Elzero in array
```

**match properties**:
- match string aganist regex
- return array with match
- return null if No match

## Metacharacters

Metacharacters are characters with a special meaning:

Character |Description
-------------|-------------
. |Find a single character, except newline or line terminator
\w |Find a word character
\W |Find a non-word character
\d |Find a digit
\D |Find a non-digit character
\s |Find a whitespace character
\S |Find a non-whitespace character
\b |Find a match at the beginning/end of a word, beginning like this: \bHI, end like this: HI\b
\B |Find a match, but not at the beginning/end of a word
\0 |Find a NULL character
\n |Find a new line character
\f |Find a form feed character
\r |Find a carriage return character
\t |Find a tab character
\v |Find a vertical tab character
\xxx |Find the character specified by an octal number xxx
\xdd |Find the character specified by a hexadecimal number dd
\udddd |Find the Unicode character specified by a hexadecimal number dddd


## Quantifiers

Quantifier |Description
-------------|-------------
n+ |Matches any string that contains at least one n
n* |Matches any string that contains zero or more occurrences of n
n? |Matches any string that contains zero or one occurrences of n
n{X} |Matches any string that contains a sequence of X n's
n{X,Y} |Matches any string that contains a sequence of X to Y n's
n{X,} |Matches any string that contains a sequence of at least X n's
n$ |Matches any string with n at the end of it
^n |Matches any string with n at the beginning of it
?=n |Matches any string that is followed by a specific string n
?!n |Matches any string that is not followed by a specific string n
?<=n |Matches any string that is priored by a specific string n
?<=n |Matches any string that is not priored by a specific string n

#### Pattern test
```javascript
// Syntax
pettern.test(input)

// return
true or false
```

## Backreferences

Within the regular expression, you can use the backreference `\1` to match the same text that was matched by the capturing group.
`([abc])=\1` matches `a=a`, `b=b`, and `c=c`. It does not match anything else.
*If your regex has multiple capturing groups, they are numbered counting their opening parentheses from left to right.*

## Named Groups and Backreferences

IMake your regexes easier to read by naming your groups.

`(?<mygroup>[abc])=\k<mygroup>` is identical to `([abc])=\1`, except that you can refer to the group by its name.




## replace & replaceAll (JS)
#### Syntax
```javascript
myStr.replace(pattern, string)
// Only first one
myStr.replaceAll(pattern, string)
// All values

let re = /@/ig
mystr.replaceAll(re, "javascript");
```

**Can boost ur ability to solve string problems **

*U can search for "Regular expression JS" website for famous regex*




