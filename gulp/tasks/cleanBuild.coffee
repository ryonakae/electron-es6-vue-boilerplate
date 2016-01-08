gulp = require 'gulp'
path = require '../path'
rimraf = require 'rimraf'


# clean build directory
gulp.task 'cleanBuild', (cb) ->
  rimraf path.build.root, cb