gulp         = require 'gulp'
plumber      = require 'gulp-plumber'
gutil        = require 'gulp-util'
gulpif       = require 'gulp-if'
concat       = require 'gulp-concat'
uglify       = require 'gulp-uglify'
errorHandler = require '../utils/errorHandler'
paths        = require '../paths'

gulp.task 'scripts', ->
	return gulp.src [
			'libs/jquery/dist/jquery.min.js'
			'libs/swiper/dist/js/swiper.jquery.js'
			'libs/jquery.nicescroll/jquery.nicescroll.js'
			'libs/ion.tabs/js/ion-tabs/ion.tabs.js'
			'libs/jelect/jquery.jelect.js'
			'common.js'
		],
			cwd: 'app/scripts'
		.pipe plumber errorHandler: errorHandler
		.pipe concat 'common.min.js'
		.pipe gulpif !gutil.env.debug, uglify()
		.pipe gulp.dest paths.scripts
