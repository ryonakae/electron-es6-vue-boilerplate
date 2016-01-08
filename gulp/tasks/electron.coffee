gulp = require 'gulp'
path = require '../path'
env = require '../env'
electron = require('electron-connect').server.create()


# Start browser process
gulp.task 'electron:start', ->
  electron.start()

# Restart browser process
gulp.task 'electron:restart', ->
  electron.restart()

# Reload renderer process
gulp.task 'electron:reload', ->
  electron.reload()