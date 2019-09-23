| RegEx  |Description   | Example|
|---|---|---|
| .  | Match any one character |.at --> cat/hat |
| *  |Match any character   | |
| +  |Match at least one instance of the expression before  |c+at--> cat/ccat/ccccat |
|^   |Start at begining of line   |^ca --> cat in a car |
|$   |Search at end of line   |at$ --> i have a cat/hat |
|<   |Match only if the word starts at this point   |<at --> at/atnt, cat is not matched|
|>   |Match only if the word stops at this point   |at> --> cat/kitkat, catA is not matched |
|\n   |Match a line break   | |
|[]   |Match any character within the brackets   |c[a,e,i,o,u]t --> cat/CET/cut/cit... (database is case insensitive)|
|[^...]   |Matches any character not listed after the ^   |[^abcde] --> cat --> t |
|[ABQ]%   |The string must begin with either the letters A, B, or Q and can be of any length   |[ACR]% --> cat, ragdoll |
|[AB][CD]%   |The string must have a length of two or more and which must begin with A or B and have C or D as the second character   |[CR][A]% --> cat, ragdoll |
|[A-Z]%   |The string can be of any length and must begin with any letter from A to Z   |Mypassword |
|[A-Z0-9]%   |The string can be of any length and must start with any letter from A to Z or numeral from 0 to 9   |9012 |
|[^A-C]%   |The string can be of any length but cannot begin with the letters A to C   |bad |
|%[A-Z]   |The string can be of any length and must end with any of the letters from A to Z   | |
|%[%$#@]%  | The string can be of any length and must contain at least one of the special characters enclosed in the bracket   |pass#words |

[More examples](https://www.rexegg.com/regex-quickstart.html)
