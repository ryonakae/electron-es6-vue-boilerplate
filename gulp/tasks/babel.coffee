gulp = require 'gulp'
path = require '../path'
env = require '../env'
gulpif = require 'gulp-if'
sourcemaps = require 'gulp-sourcemaps'
uglify = require 'gulp-uglify'
babel = require 'gulp-babel'


gulp.task 'babel:browser', ->
  gulp
    .src(
      [ path.source.root + 'main.js', path.source.browser + '**/*.js' ]
      base: path.source.root
    )
    .pipe gulpif env.isProduction == false, sourcemaps.init
      loadMaps: true
    .pipe babel
      presets: ['es2015']
    .pipe gulpif env.isProduction == false, sourcemaps.write './'
    .pipe gulpif env.isProduction == true, uglify
      preserveComments: 'some'
    .pipe gulp.dest path.build.root