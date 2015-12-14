var gulp = require('gulp');
var del = require('del');
var template = require('gulp-template');
var iconfont = require('gulp-iconfont');
var rename = require('gulp-rename');
var sequence = require('run-sequence');

var fontName = "fc-icons";

gulp.task('clean', function(callback) {
  del('dist', {force:true}, callback);
});

gulp.task('build:icon-font', function() {
  return gulp.src('svg/**/*')
      .pipe(iconfont({
        fontName: fontName, // required
        appendCodepoints: true // recommended option
      }))
      .on('codepoints', buildIconFontCss)
      .pipe(gulp.dest('dist'));

  function buildIconFontCss(codepoints) {
    gulp.src('icon-template.css.tpl')
        .pipe(template({
          glyphs: codepoints,
          fontName: fontName,
          className: 'fci'
        }))
        .pipe(rename(fontName + '.css'))
        .pipe(gulp.dest('dist'));
  }
});

gulp.task('build', function (callback) {
  sequence('clean', 'build:icon-font', callback);
});

gulp.task('default', ['build']);
