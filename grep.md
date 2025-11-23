# Args
* --color; Adds color to grep pull
* n; shows line numbers
* i; ignore case
* r; recursive search
* o; print only the matching text
* l; print ONLY the filenames where that text exists (see grep | sed oneliner)

# Find text in file
grep "hello" file.txt
# Case-insensitive search
grep -i "hello" file.txt
# Search recursively 
grep -r "main" .
# Show line numbers
-n
# Count number of matches
-c
# Regex example
grep -o "foo[0-9]*" file.txt
# Find processes with a name
ps aux | grep firefox
# Extended regex (Matches catfood or dogfood.)
grep -E '(cat|dog)food' file.txt
# Matches gogle, google, gooogle, etc.
grep -E 'go+gle' file.txt
# Get all directory items case insensitive in color
grep -nir --color "todo" .
