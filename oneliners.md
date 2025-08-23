```bash
# GREP INTO SED FOR TEXT RENAMING

Suppose you have a list of files:
echo file1.txt file2.txt file3.txt

If you want to cat them all:
echo file1.txt file2.txt file3.txt | xargs cat

This is equivalent to:
cat file1.txt file2.txt file3.txt

So now do the same here:
grep -irl --color "str_ext" ./src | xargs sed -i "s/str_ext/strex/g"
Fetch all files from grep that contain that text, feed into sed via xargs, which basically just takes a list of the files you've given releative to the path.
```
