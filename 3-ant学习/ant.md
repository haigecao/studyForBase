#＃ http://ant.apache.org/bindownload.cgi
## 下载
  .zip archive: apache-ant-1.9.7-bin.zip


###

  将下载的zip包解压到一个目录下，如/usr/local。
  这时候需要你提供修改权限，输入密码。


###

  bash-3.2#chmod +w /etc/bashrc  

###

  bash-3.2#vi /etc/bashrc  


###

  添加 路径
  export ANT_HOME=/usr/local/apache-ant-1.9.7
  export PATH=${PATH}:${ANT_HOME}/bin  

###

  ant -verison


###

  这是 构建编译一个java项目。

    ant -buildfile Builder.xml
