gulp = require 'gulp'
path = require '../path'
env = require '../env'
runSequence  = require 'run-sequence'


gulp.task 'default', ->
  # production
  if(env.isProduction == true)
    runSequence 'cleanBuild', ['copyFile', 'browserify:renderer', 'babel:browser']

  # development
  else
    runSequence 'cleanBuild', ['copyFile', 'browserify:renderer', 'babel:browser'], 'electron:start', 'watch'