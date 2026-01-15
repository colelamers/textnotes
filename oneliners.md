# GREP INTO SED FOR TEXT RENAMING

# Suppose you have a list of files:
echo file1.txt file2.txt file3.txt

# If you want to cat them all:
echo file1.txt file2.txt file3.txt | xargs cat

# This is equivalent to:
cat file1.txt file2.txt file3.txt

# So now do the same here:
grep -irl --color "str_ext" ./src | xargs sed -i "s/str_ext/strex/g"

# Fetches all files from grep that contain that text, feed into sed via xargs, which basically just takes a list of the files you've given releative to the path.

# compare files
vimdiff ~/Desktop/quotes.tsv ~/Desktop/quotes2.tsv
# Sort tsv (\t) by col2, then by col1, (eq to: ORDER BY Col2, Col1) and view data in file
vim <(sort -t$'\t' -k2,2 -k1,1 ~/Desktop/quotes.tsv)

## Note, the {} means like a temporary list of all the file locations. + means perform all in one single execution of sed
# Find sed replace; CASE SENSITIVE!
find . -type f -name "*.txt" -exec sed -i 's/oldtext/newtext/g' {} +

* Case INSENSITIVE!
find . -type f -name "*.txt" -exec sed -i 's/oldtext/newtext/gI' {} +

# Get machine specs
inxi -Fxxxrz
