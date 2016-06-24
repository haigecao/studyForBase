// 获取 gulp
var gulp = require('gulp')

// 获取 uglify 模块（用于压缩 JS）
var uglify = require('gulp-uglify')
// 获取 minify-css 模块（用于压缩 CSS）
var minifyCSS = require('gulp-minify-css')
// 获取 gulp-imagemin 模块 (用于压缩 图片)
var imagemin = require('gulp-imagemin')
// 让命令行输出的文字带颜色
var gutil = require('gulp-util')


// 压缩 js 文件
// 在命令行使用 gulp script 启动此任务
gulp.task('script', function() {
    // 1. 找到文件
    gulp.src('gulpTest/js/*.js')
    // 2. 压缩文件
        .pipe(uglify())
    // 3. 另存压缩后的文件
        .pipe(gulp.dest('dist/js'))
})

// 压缩 css 文件
// 在命令行使用 gulp css 启动此任务
gulp.task('css', function () {
    // 1. 找到文件
    gulp.src('gulpTest/css/*.css')
    // 2. 压缩文件
        .pipe(minifyCSS())
    // 3. 另存为压缩文件
        .pipe(gulp.dest('dist/css'))
})


// 压缩图片任务
// 在命令行输入 gulp images 启动此任务
gulp.task('images', function () {
    // 1. 找到图片
    gulp.src('gulpTest/img/*.*')
    // 2. 压缩图片
        .pipe(imagemin({
            progressive: true
        }))
    // 3. 另存图片
        .pipe(gulp.dest('dist/images'))
});

// 在命令行使用 gulp auto 启动此任务
gulp.task('auto', function () {
    gutil.log('message')
    gutil.log(gutil.colors.red('error'))
    gutil.log(gutil.colors.green('message:') + "some")

    
    // 监听文件修改，当文件被修改则执行 script 任务
    gulp.watch('gulpTest/js/*.js', ['script']);
    // 监听文件修改，当文件被修改则执行 css 任务
    gulp.watch('gulpTest/css/*.css', ['css']);
    // 监听文件修改，当文件被修改则执行 images 任务
    gulp.watch('gulpTest/img/*.*)', ['images']);
})


// 在命令行使用 gulp 启动 script 任务和 auto 任务
gulp.task('default', ['script', 'images', 'css', 'auto'])


















