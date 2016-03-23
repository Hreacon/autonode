# Auto Node
## Version 1.2.3

A bash script that creates the directory structure, and copies the required files for node, bower, and gulp for serving and building js node projects. It installs node and bower. Adds git commands to gulp, shows gulp status. Makes the gulp serve not crash on bad js loads. Configures atom and installs some cool packages. Provides a shell script with every project so when you clone it from github restarting is easy.
It also includes a script to create the pairs file for Epicodus students, which Automatically runs at the beginning of autonode.

### Update Log
3/23/2016 - 1.2.3 : Fixed self option in the autonode script. Added a missing dependency package, gulp-shell.
3/22/2016 - 1.2.2 : Updated file structure, gulpfile, package.json, index.html. Added typescript and angular2. Gulp Serve handles compiling typescript. This introduced a bug where browserSync does not connect, and therefore does not refresh.
1.1.2 : Removed linter-scss-lint from Atom packages because it threw errors.

### Known issues

1.2.2 - browserSync doesn't connect to the browser. This is usually caused by missing body tags, but that case doesn't apply.

### How to use

# MY CONDITIONS FOR USING THIS PROGRAM
## Fork it to your own repository
### [Original Repository](http://github.com/hreacon/autonode)
Change your name and initials in paircreator.sh, autonode.sh, and the readme template in cp/ - the default is my name
Run the script by typing
    ./autonode.sh - to create a new project including
* node
* Angular 2
* TypeScript
* bower
* gulp
* jquery
* scss
* bootstrap
* index.html, scss/styles.css, js/browser-interface.js, js/project_name.js

### Features

* New option to work alone, no pairs file creation and auto commit commits under you!
* Gulp watches for ts file changes and compiles
* Checks for existing .pairs file to prevent accidental overwriting
    * offers to write a pairs file if you haven't got one.
* Git Status in the server window
* Gulp Git Commit
* NON Crashing, auto refreshing, Gulp Serve
* Automatically installes npm and bower packages.
* Automatically opens atom for you to start writing your files while it does the above install.
* Opens the server at the end of the install so you can see your work.
* When pulling a project made with autonode from github just run ./serve.sh to config atom, install atom packages, node install, bower install, gulp build and gulp serve.
* ./serve.sh doesn't node or bower if the folders already exist

##### Easy-Commit

Just open message.txt, edit the message (the files entire contents are the commit message) and save to commit your work!

##### Atom Packages!

* TODO-show
* minimap, with highlight-selected and selected
* highlight-selected
* linter with css, scss, and js support
* file-icons
* atom-beautify - RIGHT CLICK to beautify your code!
* Config atom for soft wrap and indent guide!
* atom-typescript - TypeScript linter

### By Nicholas Jensen-Hay

Pull requests accepted from:
* Joe Karasek
  * Fixed gulp serve crash
  * Provided readme template

### License

Copyright (c) 2016 Nicholas Jensen-Hay

MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
