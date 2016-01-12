gulp = require 'gulp'
path = require '../path'


gulp.task 'watch', ->
  gulp.watch [path.source.root + 'main.js', path.source.browser + '**/*.js'], ->
    runSequence 'babel:browser', 'electron:restart'
  # gulp.watch path.build.renderer + '**/*.{html,js,vue}', ['electron:reload']
  gulp.watch path.build.renderer + '**/*.{html,js,vue}', ['electron:restart']
  gulp.watch [ path.source.root + 'config.js', path.source.renderer + '**/*.html', path.source.fonts + '**/*' ], ['copyFile']