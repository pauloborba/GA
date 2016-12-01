var gulp = require('gulp');
var jade = require('gulp-jade');
var watch = require('gulp-watch');
var path = require('path');
var sass = require('gulp-sass');
var rename = require('gulp-rename');
var gCrashSound = require('gulp-crash-sound'); //pra não esquecer da porcaria dos erros
var gutil = require('gulp-util'); //pra não travar a porcaria do jade nos erros

gCrashSound.config({
    file: '/home/thomas/Documentos/Desenvolvimento/gulp/sms-alert-1-daniel_simon.mp3',
    duration: 3 // 3 seconds. can be null (or not set) to play full length which is the default 
});
 
function errJade(err) {
    gCrashSound.play();
    gutil.log(err)
    this.emit('end');
    // handle error 
}

function errSass(err) {
    gCrashSound.play();
    //sass.logError(err)
    // handle error 
}

gulp.task('jade', function() {
  var YOUR_LOCALS = {};

  return gulp.src('./development/jade/**/*.jade')
    .pipe(jade({
      locals: YOUR_LOCALS,
      pretty: true
    }))
    .on('error', errJade)
    .pipe(rename({
        extname: ".gsp"
    }))
    .pipe(gulp.dest('./grails-app/views/'))
});

gulp.task('jade:watch', function() {
	gulp.watch('./development/jade/**/*.jade', ['jade']);
});

gulp.task('sass', function () {
  return gulp.src('./development/sass/**/*.scss')
    .pipe(sass.sync().on('error', sass.logError))
    .on('error', errSass)
    .pipe(gulp.dest('./grails-app/assets/stylesheets/'));
});

gulp.task('sass:watch', function() {
	gulp.watch('./development/sass/**/*.scss', ['sass']);
});

gulp.task('js', function() {
  return gulp.src('./development/js/**/*.js')
    .pipe(gulp.dest('./grails-app/assets/javascripts/'));
}),

gulp.task('js:watch', function() {
  gulp.watch('./development/js/**/*.js', ['js']);
});

gulp.task('watch', ['jade', 'jade:watch', 'sass', 'sass:watch', 'js', 'js:watch'], function () {

});

gulp.task('default', function() {

});

