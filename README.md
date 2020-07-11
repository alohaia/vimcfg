# vimcfg
> My vim configuration.
> Based on [amix/vimrc](https://github.com/amix/vimrc).

![](https://github.com/alohaia/photos/blob/master/showvim.png)

## Installation

1. First, **backup** and remove your `.vimrc` and `.vim`.

2. Then run the commands below.

   ```bash
   git clone https://github.com/alohaia/vimcfg.git
   cd vimcfg
   cp -r .vim .vimrc vimrcs ~
   mkdir -p ~/.vim/.temp_dirs/backupdir ~/.vim/.temp_dirs/undodir
   curl --create-dirs -o ~/vimcfg/.vim/autoload/plug.vim https://github.com/junegunn/vim-plug/blob/master/plug.vim
   ```

3. Download [ycm-core/YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) via baidunetdisk: 

   Link: https://pan.baidu.com/s/1sBMbYUsdka0XnNPZ_HJrUw  Extraction code: 0fj1

   ```
   tar -zxvf YouCompleteMe.tar.gz -C ~/.vim/plugins
   ```

   > If you have no trouble downloading YCM with git, just skip this step.

4. In vim, run:

    ```
    :PlugUpdate
    ```

    In terminal, run:

    ```bash
    mkdir ~/.vim/autoload ~/.vim/colors
    ln -s ~/.vim/plugins/molokai/colors/molokai.vim ~/.vim/colors/molokai.vim
    ln -s ~/.vim/plugins/vim-plug/plug.vim ~/.vim/autoload/plug.vim
    ```

5. Install YCM.
