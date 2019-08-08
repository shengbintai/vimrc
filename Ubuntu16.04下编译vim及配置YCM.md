# Ubunt16.04 && Vim8 && ctags && YouCompleteMe 配置

## 删除本机vim版本

```
# 卸载旧版vim及其相关组件
sudo apt-get --purge remove vim*
# 自动卸载无用依赖软件
sudo apt-get --purge autoremove
#------------------------------------------------------------------
dpkg -l | grep vim
sudo apt-get remove vim-common vim-tiny
sudo apt-get --purge remove vim*

# 卸载老旧发霉的exuberant-ctags
sudo apt-get --purge remove exuberant-ctags
# 清理无用软件包
sudo apt-get autoclean
# 更新软件源
sudo apt-get update
```

## 使用universal-ctags替代exuberant-ctags

universal-ctags是exuberant-ctags的替代者，相比gtags可以解析更多的语言，但是其他方面比如操作，数据库的组织方式等就不够好。需要自己编译安装

```
sudo apt-get install autoconf
git clone https://github.com/universal-ctags/ctags.git
./autogen.sh
./configure --prefix=/usr/local # defaults to /usr/local
make
sudo make install # may require extra privileges depending on where to install
```

## 安装编译支持库

```sh
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev  \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev liblua5.1 lua5.1-dev libperl-dev git cscope
```

## 从github下载vim

```sh
git clone https://github.com/vim/vim.git	
```

## VIM编译配置

进入到VIM目录下

compareme只能支持一个python环境，所以选择安装python3

```
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local
```
```
make
sudo make install
```
其中参数说明如下： 

- with-features = huge：支持最大特性 
- enable-multibyte：多字节支持可以在Vim中输入中文 
- enable-rubyinterp：启用Vim对ruby编写的插件的支持 
- enable-pythoninterp：启用Vim对python2 编写的插件的支持 
- enable-python3interp: 启用Vim对python3 编写的插件的支持 
- enable-luainterp：启用Vim对于lua 编写的插件的支持 
- enable-perlinterp：启用Vim对perl编写的插件的支持 
- enable-cscope：Vim对cscope支持 
- with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu :指定python路径 
- enable-gui = gtk2：gtk2支持，也可以使用gnome，表示生成gvim 
- prefix = / usr：编译安装路径
  


## 设置默认Python版本

```
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 100
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.5 200
update-alternatives --config python
```



sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 2`

## 设置默认vim为文件编辑器

使用dpkg查看
```dpkg -l vim```
设置vim为默认编辑器（vi和editor默认调用vim）

```sh
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 50
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 50
sudo update-alternatives --set editor /usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 50
sudo update-alternatives --set vi /usr/local/bin/vim
```

## 配置YouCompleteMe

```
sudo apt install build-essential cmake clang
```

```shell
git clone --recursive https://gitee.com/mirrors/youcompleteme.git ~/.vim_runtime/my_plugins/YouCompleteMe
git clone --recursive https://github.com/Valloric/YouCompleteMe.git ~/.vim_runtime/my_plugins/YouCompleteMe
#进入到YouCompleteMe文件夹下，执行如下命令，目的是确保下载内容完整
git submodule update --init --recursive
```


## 编译YouCompleteMe

```shell
cd YouCompleteMe
./install.py --clang-completer --system-libclang
```
## 发现无法启动YCM尝试采用高版本的clang
```
#go 下载失败，到这个地方下载到对应位置即可
git clone https://github.com/golang/tools.git
```
