#!/bin/bash


# read input of project name from user
# make project folder
# make js, spec and css folders in project folder
# copy in jquery, mocha, chair, and spec files in
# intialize git in the folder
# ask to run pairs command to set authors
# create initial commit with blank files

# Variables for name to be used
name="Nicholas Jensen-Hay"
email="NicholasJensenHay@gmail.com"

echo Are you working alone? [y/N]
read alone
alone=${alone:-n}
if [[ "$alone" == n* ]];
then
  ./paircreator.sh
fi

clear
echo What is the project called?
read project

if [ ! -d "$project" ]; then # if the directory does not exist
  mkdir ../"$project"
  cp -r cp/. ../"$project"/
  touch ../"$project"/app/"$project".ts
  cp -r cp/atom/config.cson ~/.atom/
  echo "Directory created and files added"

  # make sure that works then

  GIT_ADD="."
  INITIAL_COMMIT_MESSAGE="Initial Commit"

  cd ../"$project"
  if [[ "$alone" == n* ]];
  then
    echo "Enter pairs intials"
    read pairinitial
  fi

  if [ -d ".git" ]; then
    echo "Git already init"
  else
    git init
    if (( $? )); then
      echo "Unable to git init"
    fi
    if [[ "$alone" == n* ]];
    then
      git pair njh "$pairinitial"
    else
      git config user.name "$name"
      git config user.email "$email"
    fi
    if (( $? )); then
      echo "Unable to set authors"
    fi
      git add "$GIT_ADD"
    if (( $? )); then
      echo "Unable to git add"
    fi
    if [[ "$alone" == n* ]];
    then
      git pair-commit -m "$INITIAL_COMMIT_MESSAGE"
    else git commit -m "$INITIAL_COMMIT_MESSAGE"
    fi
    if (( $? )); then
      echo "Unable to git commit"
    fi
    echo "The directory was initialized"
  fi
  chmod 777 ./serve.sh
  ./serve.sh $alone
else
  echo "Directory already exists, no action taken."
fi
