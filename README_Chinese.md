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
   cp -r .vim .vimrc vimrcs ~
   mkdir -p ~/.vim/.temp_dirs/backupdir ~/.vim/.temp_dirs/undodir
   ```

3. 通过百度网盘下载 [ycm-core/YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) :
   
   链接: https://pan.baidu.com/s/1sBMbYUsdka0XnNPZ_HJrUw  提取码: 0fj1

   ```bash
   tar -zxvf YouCompleteMe.tar.gz -C ~/.vim/plugins
   ```

   > 如果你能直接用 git 下载 YCM, 那就跳过这一步。

4. 在 Vim 里，运行：

   ```
   :PlugUpdate
   ```

5. 安装 YCM.
