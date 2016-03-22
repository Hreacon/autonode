#!/bin/bash


# read input of project name from user
# make project folder
# make js, spec and css folders in project folder
# copy in jquery, mocha, chair, and spec files in
# intialize git in the folder
# ask to run pairs command to set authors
# create initial commit with blank files
./paircreator.sh
clear
echo What is the project called?
read project

if [ ! -d "$project" ]; then # if the directory does not exist
  mkdir ../"$project"
  cp -r cp/. ../"$project"/
  touch ../"$project"/app/"$project".ts
  cp -r cp/atom/config.cson ~/.atom/
  echo "Directory created and files added"
else
  echo "Directory already exists"
fi


# make sure that works then

GIT_ADD="."
INITIAL_COMMIT_MESSAGE="Initial Commit"

cd ../"$project"

echo "Enter pairs intials"
read pairinitial

if [ -d ".git" ]; then
  echo "Git already init"
else
  git init
  if (( $? )); then
    echo "Unable to git init"
  fi
  git pair njh "$pairinitial"
  if (( $? )); then
    echo "Unable to set authors"
  fi
  git add "$GIT_ADD"
  if (( $? )); then
    echo "Unable to git add"
  fi
  git pair-commit -m "$INITIAL_COMMIT_MESSAGE"
  if (( $? )); then
    echo "Unable to git commit"
  fi
  echo "The directory was initialized"
fi

chmod 777 ./serve.sh
./serve.sh
