/**
 * This file is in alphabetical order of common commands in Linux with
 * examples and notes depending on the topic and complexity.
 */
find . -type f -name "*.txt" -exec sed -i 's/\/\//#/g' {} + 

# SED, stream editor
# Find and Replace:
To replace text, you use the s/pattern/replacement/ syntax, where:
pattern is the text you want to find, replacement is the text you want to replace it with.

Example:
echo "hello world" | sed "s/world/universe/"

Output:
hello universe

# Global Replacement:
By default, sed replaces only the first occurrence of the pattern on each line. To replace all occurrences, you use the g flag (for "global").

Example:
echo "I'm learning bash scripting. Bash is fun." | sed "s/bash/shell/g"

Output:
#I'm learning shell scripting. Shell is fun.

This replaces all occurrences of bash with shell.

# Deleting Text:
You can delete lines matching a pattern using d.

For example:
echo "apple orange banana" | sed "/orange/d"

Output:
apple banana

This deletes any lines that contain the word orange.

# Inserting and Appending Text:
You can insert or append text before or after a line using i and a.

For example:
echo "first line" | sed "iThis is inserted"

Output:
This is inserted
first line

# Replacing Single Quotes with Double Quotes:
This is a typical example where sed comes in handy. In your case, you want to replace single quotes #(') with two single quotes ('') in the content:

echo "This is a 'quote'" | sed "s/'/''/g"

Output:
This is a ''quote''

This command finds all single quotes (') and replaces them with double single quotes ('').
