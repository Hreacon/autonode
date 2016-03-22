//////////////////////////// DEPENDANCIES AND VARIABLES //////////////////
var gulp = require('gulp');

// for concatenating and minifying bower files and other js/css
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');

// used for pulling in bower files
var lib = require('bower-files')({
  "overrides":{
    "bootstrap" : {
      "main": [
        "less/bootstrap.less",
        "dist/css/bootstrap.css",
        "dist/js/bootstrap.js"
      ]
    }
  }
});

// used for build and clean tasks
var utilities = require('gulp-util');
var del = require('del');
var buildProduction = utilities.env.production;

// set up server with watchers and run typescript compiler in the shell
var browserSync = require('browser-sync').create();
var shell = require('gulp-shell');

// sass dependancies
var sass = require('gulp-sass');
var sourcemaps = require('gulp-sourcemaps');


// Depreciated?
// var browserify = require('browserify');
// var source =require('vinyl-source-stream');
// var jshint = require('gulp-jshint');

// used for git status, git add and git commit
var git = require('gulp-git');
var gitignore = require('gulp-gitignore');
var fs = require('fs');

// End VARIABLES AND DEPENDANCIES
// Start TypeScript Section

// clean task
gulp.task('tsClean', function() {
  return del(['app/*.js', 'app/*.js.map']);
});

// clean then compile once. To be called from server and global build
gulp.task('ts', ['tsClean'], shell.task(['tsc']));

// End TypeScript Section
// Start Bower Section

// When adding a new bower dependancy:
// stop the server
// always use the 'bower install --save' flag.
// run 'gulp bower' to build vender files
// restart server.
gulp.task('bowerJSClean', function() {
  return del(['./build/js/vendor.min.js']);
});
gulp.task('bowerJS', ['bowerJSClean'], function() {
  return gulp.src(lib.ext('js').files)
  .pipe(concat('vendor.min.js'))
  .pipe(uglify())
  .pipe(gulp.dest('./build/js'));
});

gulp.task('bowerCSSClean', function() {
  return del(['./build/css/vendor.css']);
});
gulp.task('bowerCSS', ['bowerCSSClean'], function(){
  return gulp.src(lib.ext('css').files)
  .pipe(concat('vendor.css'))
  .pipe(gulp.dest('./build/css'));
});

gulp.task('bower', ['bowerJS', 'bowerCSS']);

// End Bower Section
// Start SASS Section

gulp.task('scssBuild', function() {
  return gulp.src('resources/styles/*')
    .pipe(sourcemaps.init())
    .pipe(sass())
    .pipe(sourcemaps.write())
    .pipe(gulp.dest('./build/css'))
    .pipe(browserSync.stream());
});

// End SCSS Section
// SERVER Section

gulp.task('serve', function() {
  browserSync.init({
    server: {
      baseDir: "./",
      index: "index.html"
    }
  });
  gulp.watch(['app/*.ts'], ['tsBuild']); // vanilla js changes, reload
  gulp.watch(['bower.json'], ['bowerBuild']);
  gulp.watch(['*.html'], ['htmlBuild']); // html changes, reload
  gulp.watch(["resources/styles/*.css", "resources/styles/*.scss"], ['scssBuild']);
  gulp.watch("message.txt", ['gitCommit']);
  gulp.watch(["*"], ["gitStatus"]);
});

gulp.task('jsBuild', function() {
  browserSync.reload();
  gulp.start('gitStatus');
});

gulp.task('tsBuild', ['ts'], function() {
  browserSync.reload();
});

gulp.task('htmlBuild', function() {
  browserSync.reload();
  gulp.start('gitStatus');
});

gulp.task('bowerBuild', ['bower'], function() {
  browserSync.reload();
  gulp.start('gitStatus');
});

// End Server Section
// Global Build task

gulp.task("build", function(){
  /* Deprecated
  if (buildProduction) {
    gulp.start('minifyScripts');
  } else {
    gulp.start('jsBrowserify');
  } */
  gulp.start('ts');
  gulp.start('bower');
  gulp.start('scssBuild');
});

// end Global Build Task
// Start Git Section

gulp.task('gitAdd', function(){
  return gulp.src('./*')
  .pipe(gitignore())
  .pipe(git.add());
});

gulp.task('gitCommit', ['gitAdd'], function(){
  var message = fs.readFileSync("./message.txt");
  return gulp.src('./*')
    .pipe(gitignore())
    .pipe(git.commit(message, {
      disableAppendPaths: true
    }));
});

gulp.task('gitStatus', function() {
  git.status({args: '--porcelain'}, function (err, stdout) {
    if(err) throw err;
  });
});

// end Git Section
// Start deprecated functions
/*

gulp.task('concatInterface', function() {
  return gulp.src(['./js/*-interface.js'])
  .pipe(concat('allConcat.js'))
  .pipe(gulp.dest('./tmp'));
});

gulp.task('jsBrowserify', ['concatInterface', 'jshint'], function() {
  return browserify({ entries: ['./tmp/allConcat.js'] })
  .bundle()
  .pipe(source('app.js'))
  .pipe(gulp.dest('./build/js'));
});

gulp.task("minifyScripts", ["jsBrowserify"], function(){
  return gulp.src("./build/js/app.js")
  .pipe(uglify())
  .pipe(gulp.dest("./build/js"));
});

gulp.task("clean", function(){
  return del(['build', 'tmp']);
});







gulp.task('jshint', function(){
  return gulp.src(['js/*.js'])
  .pipe(jshint())
  .pipe(jshint.reporter('default'))
  .pipe(jshint.reporter('fail'));
});
/**/
