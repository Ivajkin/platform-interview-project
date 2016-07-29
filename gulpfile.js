var gulp = require('gulp'),
  gutil = require('gulp-util'),
  bower = require('bower'),
  debug = require('gulp-debug'),
  watch = require('gulp-watch'),
  bowerFiles = require('main-bower-files'),
  concat = require('gulp-concat'),
  browserSync = require('browser-sync').create(),
  url = require('url'),
  proxy = require('http-proxy-middleware'),
  historyApiFallback = require('connect-history-api-fallback'),
  coffee = require('gulp-coffee'),
  replace = require('gulp-replace'),
  sourcemaps = require('gulp-sourcemaps'),
  haml = require('gulp-ruby-haml'),
  htmlmin = require('gulp-htmlmin'),
  sass = require('gulp-sass'),
  autoprefixer = require('gulp-autoprefixer'),
  minifyCss = require('gulp-minify-css'),
  rename = require('gulp-rename'),
  templateCache = require('gulp-angular-templatecache'),
  queue = require('streamqueue'),
  sh = require('shelljs'),
  Server = require('karma').Server,
  coveralls = require('gulp-coveralls');

var paths = {
  sass: ['app/styles/**/*.scss'],
  js: ['app/**/*.coffee'],
  vendor: {
    js: 'vendor/javascript/*.js'
  },
  html: ['app/**/*.haml'],
  index: ['app/index.html'],
  fonts: ['./bower_components/ionic/fonts/**/*.{ttf,woff,eot,svg}', 'app/fonts/*.{ttf,woff,eot,svg}'],
  dist: ['www/app/dist/**/*']
};

var URLS = {
    api: {
        host: 'http://localhost:3000',
        path: '/app',
        proxyPath: ['**/*.json']
    }
}
var proxyOptions = {
    target: URLS.api.host, // target host
    changeOrigin: true,               // needed for virtual hosted sites
    ws: false,                         // proxy websockets
};

function fileTypeFilter (files, extension) {
  var regExp = new RegExp('\\.' + extension + '$');
  return files.filter(regExp.test.bind(regExp));
};


gulp.task('default', ['build']);
gulp.task('serve', ['connect', 'build', 'watch']);
gulp.task('build', [ 'clean-dist', 'index', 'sass', 'vendor-javascript', 'javascript', 'templates', 'fonts', 'images']);

gulp.task('connect', function() {
    browserSync.init({
        ui: false,
        port: 8080,
        server: {
            baseDir: "./www",
            middleware: [ proxy(URLS.api.proxyPath, proxyOptions), historyApiFallback({ verbose: true }) ]
        },
        startPath: 'app/workflow'
    });
});

gulp.task('clean-dist', function() {
  return sh.rm('-r', 'www');
});

gulp.task('index', function() {
  return gulp.src('app/index.html')
    .pipe(htmlmin({collapseWhitespace: true}))
    .pipe(gulp.dest('www'))
    .pipe(browserSync.stream());
});

gulp.task('sass', function() {
  gulp.src(paths.sass)
    .pipe(sass({
      errLogToConsole: true
    }))
    .pipe(concat('app.css'))
    .pipe(autoprefixer({
      browsers: ['last 2 versions']
    }))
    .pipe(gulp.dest('www/app/dist/'))
    .pipe(browserSync.stream());

});

gulp.task('vendor-javascript', function() {
  var files = bowerFiles({paths: './', debugging: true}),
    vendorJs = fileTypeFilter(files, 'js'),
    q = new queue({objectMode: true});
    q.queue(gulp.src(vendorJs.concat(paths.vendor.js))
      .pipe(sourcemaps.init({loadMaps: true}))
      .pipe(concat('vendor.js'))
      .pipe(sourcemaps.write())
      .pipe(gulp.dest('./www/app/dist'))
    );
    return q.done();
});


gulp.task('javascript', function(done) {
  return gulp.src([
      'app/app.coffee',
      'app/constants.coffee',
      'app/resources.coffee',
      'app/services.coffee',
      'app/templates.coffee',
      'app/router.coffee',
      'app/controllers.coffee',
      'app/**/*.coffee'
    ])
    .pipe(coffee())
    .on('error', function(e) {
      console.log(gutil.colors.red('ERROR'), e);
      // emit here
      this.emit('end');
    })
    .pipe(sourcemaps.init())
    .pipe(concat('app.js'))
    .pipe(sourcemaps.write())
    .pipe(gulp.dest('www/app/dist'))
    .pipe(browserSync.stream());
});

gulp.task('templates', function() {
    gulp.src('./app/templates/**/*.haml', {read: true})
        .pipe(haml().on('error', function(e) { console.log(e.message); }))
        .pipe(templateCache())
        .pipe(gulp.dest('www/app/dist'))
        .pipe(browserSync.stream());
});

gulp.task('fonts', function () {
  return gulp.src(paths.fonts)
    .pipe(debug({title: 'fonts'}))
    .pipe(gulp.dest('./www/assets/fonts'));
});

gulp.task('images', function () {
  return gulp.src([
    './app/images/**/*',
  ])
  .pipe(debug({title: 'images'}))
  .pipe(gulp.dest('./www/app/assets'));
});

gulp.task('watch', function() {
  gulp.watch(paths.sass, ['sass']);
  gulp.watch(paths.js, ['javascript']);
  gulp.watch(paths.html, ['templates']);
  gulp.watch(paths.index, ['index']);
});

gulp.task('install', ['git-check'], function() {
  return bower.commands.install()
    .on('log', function(data) {
      gutil.log('bower', gutil.colors.cyan(data.id), data.message);
    });
});

gulp.task('test', function (done) {
  new Server({
    configFile: __dirname + '/test/karma.conf.js',
    singleRun: gutil.env.watch ? false : true
  }, done).start();
  gulp.src('test/coverage/**/lcov.info')
  .pipe(coveralls());
});

gulp.task('git-check', function(done) {
  if (!sh.which('git')) {
    console.log(
      '  ' + gutil.colors.red('Git is not installed.'),
      '\n  Git, the version control system, is required to download Ionic.',
      '\n  Download git here:', gutil.colors.cyan('http://git-scm.com/downloads') + '.',
      '\n  Once git is installed, run \'' + gutil.colors.cyan('gulp install') + '\' again.'
    );
    process.exit(1);
  }
  done();
});
