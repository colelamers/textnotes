.gitignore # this file is placed in the same dir as the .git folder. NOT INSIDE .git folder. 
           # you can add directories, files, extensions to this file. So if you want a folder
           # to be ignored, you just add the folder (like you would cd into terminal) and
           # and put it on a new line. Directory path is relative to .gitignore dir however.
           # * /.vs
           # * /ThisFolder/Here
git init
git clone "url"
git remote add origin "branch"
git remote -v # shows remotes
git remote add origin https:#github.com/colelamers/project.git
git push origin "branch" # master == the branch, can do pull as well
git pull origin "branch"
git pull origin "branch" --allow-unrelated-histories # a merge-pull, combines two repos
git add --all # 'git add .' does the same thing as well.
git commit -m 'comment here'
git branch branchNameHere # add a new branch 
git branch -d "branch" # This is a way to delete a branch
git switch newBranchToSwitchTo # switches branches and makes it active
git merge "branch" # This merges the specified "branch" INTO the current branch you are on.
                   # So if you are on MASTER and made code changes while working in DEV, you
                   # would do add/commit the DEV changes, then do a 'git merge dev'. This takes
                   # the changes you made in dev and merges them INTO master. 
                   # Simply put, the "merge" command pulls code changes INTO whatever branch 
                   # you are currently on.
git remote set-url origin https:#github.com/colelamers/vscode-settings.git # resets a remote
git log --graph
git reset --hard # reverts all local changes since last commit on the branch you are on
git reset # undo all "git add"'s 
git restore . # reverts all changes since last commit
git restore ./Path/To/File.cs # basically "git undo" for everything not added to staging area
git status --ignored # displays all ignored files/folders/extensions in .gitignore file
git rm -r --cached . # This removes a file/folder recursively from the git repository. It does
                     # NOT delete the files. It just removes them from the git repo's tracking. 
git fetch "remote" "branch"
git diff "branch" "origin/branch"
git rebase "branch" # for bringing a specific branch up to date with another branch
                    # changes will be lost
git revert 
git reset HEAD^ # This undoes a commit but keeps the changes you had before you made the add/commit
git push -f origin main # This overwrites the previous push that shouldn't have been pushed.
___________________________________________________________________________________________________
|   Workspace   |   Staging Area   |   Local Repo/Origin Repo   |||   Server Remote/Origin Repo   |
===================================================================================================
git add        git commit           git push  
  ---------------> ----------------------> --------------------------------------->
git reset (file)
  <-----------------
                   git merge                                        git fetch
  <------------------------------------------------------ <------------------------
                   git pull
  <--------------------------------------------------------------------------------
                   git rebase                                       git fetch
  <------------------------------------------------------ <------------------------
                   git pull --rebase
  <--------------------------------------------------------------------------------

--cd path/to/your/local/directory

# make it a git repository
--git init

#checkout to a new branch containing your local changes
--git checkout -b my_awesome_branch 
--git add --all

# add user to config
git config user.email "example@cool.com"
git config user.name "johnny ive"

# initial commit
# git-bash and *NIX systems use single quotes. windows uses double quotes
--git commit -m 'This should be a Message describing your local changes'
--git add . && git commit -m "initial commit"

#  To Setup a repo
cd /navigate/to/repo/root/
--git init

# adds everything
--git add . 

# OR add each dir individually, (like you wanted to hide the ssh keys)
--git add thisDir
--git add thatDir
--git add anotherDir #etc, you get the point
--git commit -m 'initialize repo'

# To clone a repo from a server
--git clone username@domainAccess8370.providedToMe.com:

# colon designates pull the entire repo. Variations include below
--git clone raspberry@192.168.1.117:/folderName.git

# after the colon is the folder you wish to clone. git just adds the .git at the
# the end. just a conventional thing so remember that.
# website is pulled as the repo basically

# General Notes
--git remote add origin root@189.14.666.666:/var/www/html/.git
--git remote add my_awesome_upstream <your-upstream-git-repository-url>
--git remote -v # To list remotes, and see if your remote is added correctly
--git push my_awesome_upstream my_awesome_branch

--git reset --hard 
    removes all changes and reverts to previous version

must add all files before you can perform a commit

--git diff
    shows the changes in the current file to the most recent commit

--git log
    shows the commit log
    
--git log --graph 
    shows the commit tree
    
--git checkout 'branch'
    switch between branches

--git merge 'branch'
    this takes the differences from the branch you want to merge, and pulls them into the current branch you are on, brining it up to the same level as that branch.
    
--git branch -d 'branch'
    deletes the branch
    
-- git remote add origin https:#github.com/c0ldlimit/vimcolors.git
-- git push -u origin master
    this performs a push to the origin and then branch "master"
    before deploying to github!, make a main branch and make that the origin.
    so:
        git push -u origin main -f
    
-- git checkout master
-- git branch main master -f
     this forcibly resets the first branch stated to the second branch (basically, copy master --> main). because github is full of racist bleeding heart liberals that don''t actually want to resolve real problems and just want to entrench the status quo, we have to rename things to main.
-- git checkout main
-- git push origin main -uf

-- git rm -r --cached folderPathName
    this removes a folder from the local git repo (not actually deleting files)
