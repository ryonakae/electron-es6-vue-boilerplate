minimist = require 'minimist'
gutil = require 'gulp-util'


minimistOption =
  string: 'env',
  default:
    env: process.env.NODE_ENV || 'development'

options = minimist(process.argv.slice(2), minimistOption)

isProduction = false
if(options.env == 'production')
  isProduction = true

gutil.log '[env]', gutil.colors.yellow(options.env), '[isProduction]', gutil.colors.yellow(isProduction)


module.exports =
  isProduction: isProduction