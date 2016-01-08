gulp = require 'gulp'
path = require '../path'
env = require '../env'
browserify = require 'browserify'
vueify = require 'vueify'
babelify = require 'babelify'
watchify = require 'watchify'
source = require 'vinyl-source-stream'
buffer = require 'vinyl-buffer'
uglify = require 'gulp-uglify'
sourcemaps = require 'gulp-sourcemaps'
gutil = require 'gulp-util'
gulpif = require 'gulp-if'
prettyHrtime = require 'pretty-hrtime'


# browserify task
gulp.task 'browserify:renderer', ->
  compile env.isProduction, './'+path.source.renderer+'app.js', './'+path.build.renderer, 'app.js'


# compile function
compile = (isProduction, srcPath, destPath, destName) ->
  option =
    transform: [vueify, [babelify, {'presets': 'es2015'}]]
    # transform: [vueify]
    debug: true
    extensions: ['.js']
  bundler = null
  bundleJs = destName
  bundleLogger = new BundleLogger srcPath, bundleJs

  # production(browserify)
  if(isProduction == true)
    bundler = browserify srcPath, option

  # development(watchify)
  else
    option.cache = {}
    option.packageCache = {}
    option.fullPaths = true
    bundler = watchify browserify srcPath, option
    bundleLogger.watch()

  bundle = ->
    bundleLogger.begin()
    bundler
      .bundle()
      .on 'error', (err)->
        gutil.log 'Browserify Error: \n' + gutil.colors.red(err.message)
      .pipe source bundleJs
      .pipe buffer()
      .pipe gulpif isProduction == false, sourcemaps.init
        loadMaps: true
      .pipe gulpif isProduction == false, sourcemaps.write './'
      .pipe gulpif isProduction == true, uglify
        preserveComments: 'some'
      .on 'end', bundleLogger.end
      .pipe gulp.dest destPath

  bundler.on 'update', bundle

  bundle()


# logger function
class BundleLogger
  constructor: (src, bundle) ->
    @beginTime = null

    @begin = =>
      @beginTime = process.hrtime()
      gutil.log 'Bundling', gutil.colors.green(src) + '...'

    @watch = ->
      gutil.log 'Watching files required by', gutil.colors.yellow(src)

    @end = =>
      taskTime = process.hrtime @beginTime
      prettyTime = prettyHrtime taskTime
      gutil.log 'Bundled', gutil.colors.green(bundle), 'in', gutil.colors.magenta(prettyTime)