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
    runSequence 'cleanBuild', ['copyFile', 'browserify:renderer', 'babel:browser'], 'electron:start'

    # watch file
    gulp.watch [path.source.root + 'main.js', path.source.browser + '**/*.js'], ->
      runSequence 'babel:browser', 'electron:restart'
    # gulp.watch path.build.renderer + '**/*.{html,js,vue}', ['electron:reload']
    gulp.watch path.build.renderer + '**/*.{html,js,vue}', ['electron:restart']
    gulp.watch [ path.source.root + 'config.js', path.source.renderer + '**/*.html', path.source.fonts + '**/*' ], ['copyFile']