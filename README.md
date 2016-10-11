# Testing bidirectional text

Test [bsc#989383](https://bugzilla.suse.com/show_bug.cgi?id=989383), where
parentheses are broken in a LTR layout but correct in a RTL layout:

    ./yast-test.rb "ذ&اكرة USB كبيرة السعة التخزينية (عصا، قرص ذاكرة USB)..."

