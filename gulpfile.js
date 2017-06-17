var gulp          = require('gulp');
var browserSync   = require('browser-sync');

gulp.task('connect-sync', function() {
  browserSync.init({
       server: {
           baseDir: "./"
       }
   });
});

gulp.task('reload', function(){
  browserSync.reload();
});

gulp.task('default',['connect-sync'], function() {
  gulp.watch([
    './**/*.html',
    './**/*.js',
    './**/*.css',
  ], ['reload']);
});
