gulp = require 'gulp'
path = require '../path'
env = require '../env'
imagemin = require 'gulp-imagemin'
pngcrush = require 'imagemin-pngcrush'
cache = require 'gulp-cache'
spritesmith = require 'gulp.spritesmith'
gulpif = require 'gulp-if'


imageminOption =
  optimizationLevel: 7
  progressive: true
  interlaced: true
  svgoPlugins: [{removeViewBox: false}]
  use: [pngcrush()]


# ImageMin
gulp.task 'imageMin', ->
  gulp
    .src [
      path.source.images + '**/*'
      '!' + path.source.sprite + '*'
    ]
    .pipe gulpif env.isProduction == true, cache imagemin imageminOption
    .pipe gulp.dest path.build.images


# image sprite
gulp.task 'imageSprite', ->
  spriteData = gulp.src path.source.sprite + '*.png'
  .pipe spritesmith
    imgName: 'sprite.png'
    imgPath: '../images/sprite.png'
    cssName: '_sprite.styl'
    padding: 10
    retinaSrcFilter: path.source.sprite + '*-2x.png'
    retinaImgName: 'sprite-2x.png'
    retinaImgPath: '../images/sprite-2x.png'

  spriteData.img
    .pipe gulpif env.isProduction == true, cache imagemin imageminOption
    .pipe gulp.dest path.source.images

  spriteData.css
    .pipe gulp.dest path.source.stylesheets