# vimcfg

> 我的 vim 配置。
> 基于 [amix/vimrc](https://github.com/amix/vimrc)。

![](https://github.com/alohaia/photos/blob/master/showvim.png)

**你仍然可以使用这个仓库，但是我已经不再维护它.**

你也许会对[我的 NeoVim 配置](https://github.com/alohaia/nvimcfg)感兴趣。

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

   > 网络太慢，我直接用了本机的文件。

3. **如果你能以令人满意的速度下载 github 上的项目 (如 YouCompleteMe及其所有子项目) 和 https://dl.bintray.com/ycm-core/libclang/libclang-10.0.0-x86_64-unknown-linux-gnu.tar.bz2，请无视这一步。**
   
   下载插件（有一些插件其实下载挺快的，但我还是把所有插件都弄来了）：

   - 百度网盘：链接: https://pan.baidu.com/s/1h1mlLNe-H5Q0s8pFSnlrWQ  提取密码: o6r3
   - CSDN：https://me.csdn.net/download/qq_39821787
   
   在 .vim 目录下创建 plugins 目录，把压缩包里的插件全部解压到 plugins 下。
   
4. 在 Vim 里，运行：

   ```
   :PlugUpdate
   ```

   在终端中，运行：

   ```bash
   mkdir ~/.vim/colors
   rm ~/.vim/autoload/plug.vim
   ln -s ~/.vim/plugins/molokai/colors/molokai.vim ~/.vim/colors/molokai.vim
   ln -s ~/.vim/plugins/vim-plug/plug.vim ~/.vim/autoload/plug.vim
   ```

5. 安装 YCM。
