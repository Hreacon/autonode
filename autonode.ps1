#!/bin/bash


# read input of project name from user
# make project folder
# make js, spec and css folders in project folder
# copy in jquery, mocha, chair, and spec files in
# intialize git in the folder
# ask to run pairs command to set authors
# create initial commit with blank files

clear
Write-Host What is the project called?
$project = Read-Host

mkdir ../"$project"
mkdir ../"$project"/js 
mkdir ../"$project"/scss 
mkdir ../"$project"/atomconfigfile
copy cp/js/* ../"$project"/js/
touch ../"$project"/js/"$project".js
copy cp/scss/* ../"$project"/scss/
copy cp/* ../"$project"/
Write-Host "Directory created and files added"

# make sure that works then

cd ../"$project"

if(Test-Path "C:\Program Files (x86)\Microsoft VS Code\Code.exe")  {
  mkdir .vscode
  copy ..\csharpsetup\cp\vscode\* .\.vscode\
  code .
  $editor = "Visual Studio Code"
} else {
  Write-Host "Setting up atom"
  copy cp/atom/config.cson ~/.atom/
  copy cp/atom/config.cson ../"$project"/atomconfigfile/
  apm install TODO-show
  apm install minimap minimap-highlight-selected minimap-selection
  apm install highlight-selected
  apm install linter linter-csslint linter-scss-lint linter-jshint
  apm install file-icons
  apm install atom-beautify
  # apm install color-picker
  # apm install merge-conflicts
  $editor = "Atom"
  atom .
}

npm install
bower install

if(Test-Path ".git") {
  Write-Host "Git already init"
} else {
  git init
  git add .
  git commit -m "Initial Commit"
  Write-Host "The directory was initialized"
}

gulp build
gulp serve
