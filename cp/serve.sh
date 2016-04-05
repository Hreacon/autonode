#!/bin/bash

if [ ! -d ~/.atom/packages/minimap ]; then
  echo "Setting up atom"
  cp -r ./atomconfigfile/config.cson ~/.atom/
  apm install TODO-show
  apm install minimap minimap-highlight-selected minimap-selection
  apm install highlight-selected
  apm install linter linter-csslint linter-jshint
  apm install file-icons
  apm install atom-beautify
  apm install atom-typescript
  apm install multi-cursor
  # apm install color-picker
  # apm install merge-conflicts
fi

echo "Opening directory in atom"
atom .
if [ $# -eq 0 ]; then
  echo Are you working alone? [y/N]
  read alone
  alone=${alone:-n}
else alone=$1
fi
if [ ! -d "./node_modules" ]; then
  npm install
  if [[ $alone == n* ]];
  then
    sed -i 'bak' 's/git commit/git pair-commit/g' ./node_modules/gulp-git/lib/commit.js
  fi
fi

if [ ! -d "bower_componenets" ]; then
  bower install
fi

if [ ! -d "build" ]; then
  gulp build
fi

while true
do
  gulp serve
done
