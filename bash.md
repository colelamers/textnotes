# Set scripting language at top of file
* #!/bin/bash, #!/bin/perl
# Make script exectuable
chmod +x my_script.sh
# Exectute shell script
./my_script.sh

# Run script with current shell (if you don't do this, it will run with a child process)
source ./script.sh

# Accept args, these values are native bash variables
echo "Script name: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "All arguments: $@"
echo "Number of arguments: $#"

# Get arg flags
```bash
#!/bin/bash

while getopts "n:a:" opt; do
  case $opt in
    n) name="$OPTARG" ;;
    a) age="$OPTARG" ;;
    \?) echo "Invalid option: -$OPTARG" >&2 ;;
  esac
done

echo "Name: $name"
echo "Age: $age"

# Command ran
./script.sh -n Soren -a 42
```


## #####################################################
## ############# Permissions ###########################
## #####################################################

# Chmod number meanings
Ex. chmod 654, chmod +u main
    + means "add permissions", 
    - means "remove permissions"
    #######################
    # NOTE: Can only add with numbers, CANNOT REMOVE!
    * 7, read-write-execute
    * 6, read-write
    * 5, read-execute
    * 4, read only
    * 3, write-execute
    * 2, write only
    * 1, execute only
    * 0, no permissions
    #######################
    * Owner: 6 (Read, Write)
    * Group: 5 (Read, Execute)
    * Others: 4 (Read)
    #######################
    * +r, add read permissions
    * -w, remove write permissions
    * u+r, add owner read permissions 
    * o-w, remove others write permissions
    * a+x, add everyone execute permissions
    * g-rw, remove group read-write permissions
# 
