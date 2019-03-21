This text includes the bidirectional formatting characters, for easier
copying and pasting. The control characters are placed between the letters
"az" and "اي".

| Control Character      | Code point | Literal | Bash      | Ruby       |
|------------------------|------------|---------|-----------|------------|
|Left-to-right mark      | U+200E     | a‎z ا‎ي   | $'\u200E' | "\u{200E}" |
|Right-to-left mark      | U+200F     | a‏z ا‏ي   | $'\u200F' | "\u{200F}" |
|Left-to-right embedding | U+202A     | (none)  | $'\u202A' | "\u{202A}" |
|Right-to-left embedding | U+202B     | (none)  | $'\u202B' | "\u{202B}" |
|Pop Directional Format  | U+202C     | (none)  | $'\u202C' | "\u{202C}" |

In Emacs, you can use the "ucs" input method (C-x RET C-\ ucs RET) and type
`u200e` or `u200f` (or any other Unicode code point by its hexadecimal number).
