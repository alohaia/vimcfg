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
   curl --create-dirs -o ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

3. **如果你能以令人满意的速度下载 github 上的项目和 https://dl.bintray.com/ycm-core/libclang/libclang-10.0.0-x86_64-unknown-linux-gnu.tar.bz2，请无视这一步。**
   
   下载 YCM：https://download.csdn.net/download/qq_39821787/12505516，并解压：

   ```bash
   mkdir ~/.vim/plugins
   tar -zxvf YouCompleteMe.tar.gz -C ~/.vim/plugins
   ```
   
   > ale、ultisnips和vimpolyglot：https://download.csdn.net/download/qq_39821787/12603272，有需要也可以下载。
   
   下载 libclang：https://download.csdn.net/download/qq_39821787/12603251，并移动到 clang_archives 下：
   
   ```
   cp libclang-10.0.0-x86_64-unknown-linux-gnu.tar.bz2 ~/.vim/plugins/YouCompleteMe/third_party/ycmd/clang_archives
   ```
   
4. 在 Vim 里，运行：

   ```
   :PlugUpdate
   ```

   在终端中，运行：

   ```bash
   mkdir ~/.vim/autoload ~/.vim/colors
   rm ~/.vim/autoload/plug.vim
   ln -s ~/.vim/plugins/molokai/colors/molokai.vim ~/.vim/colors/molokai.vim
   ln -s ~/.vim/plugins/vim-plug/plug.vim ~/.vim/autoload/plug.vim
   ```

5. 安装 YCM。
