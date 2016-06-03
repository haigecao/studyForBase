## mysql 安装
    
    $ sudo brew install mysql  
    ==> Downloading https://homebrew.bintray.com/bottles/mysql-5.7.12.el_capitan.bottle.tar.gz
    Already downloaded: /Library/Caches/Homebrew/mysql-5.7.12.el_capitan.bottle.tar.gz
    ==> Pouring mysql-5.7.12.el_capitan.bottle.tar.gz
    ==> /usr/local/Cellar/mysql/5.7.12/bin/mysqld --initialize-insecure --user=root --basedir=/usr/local/Cellar/mysql/5.7.12 --
    ==> Caveats
    We've installed your MySQL database without a root password. To secure it run:
        mysql_secure_installation

    To connect run:
        mysql -uroot

    To have launchd start mysql at login:
      ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
    Then to load mysql now:
      launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
    Or, if you don't want/need launchctl, you can just run:
      mysql.server start
    ==> Summary
    🍺  /usr/local/Cellar/mysql/5.7.12: 13,281 files, 444.8M





## 在mac下面是用brew安装mysql，出了很多错误，其中就是在 etc/下面没有my.cnf文件    