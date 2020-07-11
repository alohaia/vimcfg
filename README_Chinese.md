# vimcfg

> 我的 vim 配置。
> 基于 [amix/vimrc](https://github.com/amix/vimrc)。

![](https://github.com/alohaia/photos/blob/master/showvim.png)

## 安装

1. 首先，备份并移除你的 `.vimrc` 和 `.vim`。

2. 然后运行下面的命令。

   ```bash
   git clone https://github.com/alohaia/vimcfg.git
   cd vimcfg
   cp -r .vimrc vimrcs ~
   mkdir -p ~/.vim/.temp_dirs/backupdir ~/.vim/.temp_dirs/undodir
   curl --create-dirs -o ~/.vim/autoload/plug.vim https://github.com/junegunn/vim-plug/blob/master/plug.vim
   ```

3. 通过百度网盘下载 [ycm-core/YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) :
   
   链接: https://pan.baidu.com/s/1sBMbYUsdka0XnNPZ_HJrUw  提取码: 0fj1

   ```bash
   mkdir ~/.vim/plugins
   tar -zxvf YouCompleteMe.tar.gz -C ~/.vim/plugins
```
   
> 如果你能直接用 git 下载 YCM, 那就跳过这一步。
   
4. 在 Vim 里，运行：

   ```
   :PlugUpdate
   ```

   在终端中，运行：

   ```bash
   mkdir ~/.vim/autoload ~/.vim/colors
   ln -s ~/.vim/plugins/molokai/colors/molokai.vim ~/.vim/colors/molokai.vim
   ln -s ~/.vim/plugins/vim-plug/plug.vim ~/.vim/autoload/plug.vim
   ```

5. 安装 YCM.
