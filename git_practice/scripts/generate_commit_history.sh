#!/usr/bin/env bash

REPO_NAME="sample_git_repository"
FILE_1="file_1.txt"
FILE_2="file_2.txt"
FILE_3="file_3.txt"

create_repo() {
    mkdir $REPO_NAME
    cd $REPO_NAME
    git init
    echo -e "\nCreated new git repository in $REPO_NAME \n"
}

if [ ! -d $REPO_NAME ]; then
    create_repo
else
    while true; do
        read -p "Sample repository already exists: would you like to overwrite it? " choice

        case $choice in
            [Yy]* )
                rm -rf $REPO_NAME;
                create_repo
                echo -e "Overwritten $REPO_NAME \n";
                break
                ;;

            [Nn]* )
                exit;;

            * )
                echo "Please answer yes or no:";;

        esac
    done
fi

# This is only executed if a new repo is created, or if the user chooses to overwrite an existing repository

# Create the initial files and commit them
cat > $FILE_1 <<- EOM
Initial line A in file 1
Initial line B
EOM

cat > $FILE_2 <<- EOM
Initial line A in file 2
Initial line B
EOM

git add $FILE_1 $FILE_2
git commit -m "Commit 1 - Add initial files"

# Make some changes to the files
echo "New line C from second commit" >> $FILE_1
git add $FILE_1
git commit -m "Commit 2 - Add a new line to file_1"

echo "New line C from second commit" >> $FILE_2
git add $FILE_2
git commit -m "Commit 3 - Add a new line to file_2"

# Add a new file to the repo
cat > $FILE_3 <<- EOM
Line A - this
Line B - is
Line C - third
Line D - sample
Line E - file
EOM
git add $FILE_3
git commit -m "Commit 4 - Add a third file"

# Remove file_2 from the repo
git rm $FILE_1
git commit -m "Commit 5 - Remove file_1"