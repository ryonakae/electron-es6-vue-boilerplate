gulp = require 'gulp'
path = require '../path'
env = require '../env'
electron = require('electron-connect').server.create()


# Start browser process
gulp.task 'electron:start', ->
  # avoid multiple window
  isStarted = false

  if isStarted == false
    electron.start null, ->
      isStarted = true


# Restart browser process
gulp.task 'electron:restart', ->
  electron.restart()


# Reload renderer process
gulp.task 'electron:reload', ->
  electron.reload()