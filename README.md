# Testing bidirectional text

## [bsc#989383](https://bugzilla.suse.com/show_bug.cgi?id=989383)

Test [bsc#989383](https://bugzilla.suse.com/show_bug.cgi?id=989383), where
parentheses are broken in a LTR layout but correct in a RTL layout.

Run this (never mind that the browser or the terminal may render the argument
incorrectly already):

    ./yast-test.rb "ذ&اكرة USB كبيرة السعة التخزينية (عصا، قرص ذاكرة USB)..."

Here the global context is left to right. Even if you cannot read Arabic, you
can observe that some of the widgets have both parentheses facing the same
way, which is wrong:

![LTR, bad](screenshots/bidi-usb-ltr-bad.png)

When we set the context to right-to-left, the labels are rendered correctly:

![RTL, good](screenshots/bidi-usb-rtl-good.png)

## [bsc#953334](https://bugzilla.suse.com/show_bug.cgi?id=953334)

This is a case of an English word with a parenthesised English gloss in an
Arabic text. Let's say "I love GNU (GNU's not Unix)":

    ./yast-test.rb "أنا أحب GNU (Gnu's Not Unix)."

In the (incorrect) LTR context at least the parentheses are correct.

(TODO add screenshots)

It should help to add an invisible right-to-left-mark (U+200F)
between the GNU and the opening parenthesis.

## [bsc#989384](https://bugzilla.suse.com/show_bug.cgi?id=989384)

This text is a translation of "Toggle Status (On or Off)"
