# vimcfg
> My vim configuration.
> Based on [amix/vimrc](https://github.com/amix/vimrc).

![](https://github.com/alohaia/photos/blob/master/showvim.png)

**You can still use this repositories, but it's NO LONGER MAINTAINED.**

Maybe you will be interested in my configuration for NeoVim: https://github.com/alohaia/nvimcfg.

## Installation

1. First, **backup** and remove your `.vimrc` and `.vim`.

2. Then run the commands below.

   ```bash
   git clone https://github.com/alohaia/vimcfg.git
   cd vimcfg
   cp -r .vim .vimrc vimrcs ~
   mkdir -p ~/.vim/.temp_dirs/backupdir ~/.vim/.temp_dirs/undodir
   curl --create-dirs -o ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

3. If you have no trouble downloading YCM, libclang and etc, just ignore this step.

   国内用户（准确地说，是下载遇到问题的用户）请阅读[中文版本](https://github.com/alohaia/vimcfg/blob/master/README_Chinese.md)中的额外步骤。

4. In vim, run:

    ```
    :PlugUpdate
    ```

    In terminal, run:

    ```bash
    mkdir ~/.vim/colors
    rm ~/.vim/autoload/plug.vim
    ln -s ~/.vim/plugins/molokai/colors/molokai.vim ~/.vim/colors/molokai.vim
    ln -s ~/.vim/plugins/vim-plug/plug.vim ~/.vim/autoload/plug.vim
    ```

1. Install YCM.

## Licence

MIT
