## gulp
    
        一款nodeJs应用。打包，压缩，合并，git，远程操作。。。
    


### 这个人写的已经很好了，我就不画蛇添足了。
    
    https://github.com/nimojs/gulp-book

    http://www.w3ctech.com/topic/134
    

###

    

        检测代码修改自动执行任务

    js/a.js一旦有修改 就必须重新在命令行输入 gulp script ，这很麻烦。

    可以使用 gulp.watch(src, fn) 检测指定目录下文件的修改后执行任务。
    
    在 gulpfile.js 中编写如下代码：

    // 监听文件修改，当文件被修改则执行 script 任务
    
    gulp.watch('js/*.js', ['script']);


