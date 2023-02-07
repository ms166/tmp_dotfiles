## Neovim
* Download and install neovim using a package manager or from source.
* `init.vim` is the `.vimrc` equivalent file.
    * Place this in `~/.config/nvim/`.
* Install the plugin manager [plugged](https://github.com/junegunn/vim-plug).
    * The `plug.vim` file is to be placed in `~/.local/share/nvim/site/autoload/`.
        * Create the folders above if they do not exist.
* Install plugins by running `:PlugInstall` in vim.

## Tmux
* Download and install tmux using a package manager or from source.
* Create `~/.tmux/` directory.
* Place the file `.tmux.conf` in `~/.tmux/`.
* Create a file `~/.tmux.conf` and put the following line in it:
    * `source-file ~/.tmux/.tmux.conf`
* Install [tpm](https://github.com/tmux-plugins/tpm) (Tmux Plugin Manager)
    * Install tmux plugins using `prefix + I` where prefix is `ctrl + a`.

## Remap capslock to ctrl
* Run the script `change_caps_to_ctrl_manjaro.sh` on login.
    * Most OS's will have a way to execute custom scripts on startup --- for xfce see the [arch wiki](https://wiki.archlinux.org/index.php/xfce#Autostart).

## .bashrc
* Add the contents of `.bashrc` to the default `~/.bashrc`.

## Environment variables
* Copy the `environment` file to `/etc/environment`.
* Run : `source /etc/environment`
    * You might have to add this line to `.bash_profile`, if the environment variables do not automatically update during login.

## Applications using GTK-Themes
* If you've set a particular theme for the system, for example, a dark one, then other applications may use the system's theme even when you don't want it to. To fix it, you have to modify application specific config files and explicitly mention not to use the system's theme.
* For firefox, edit the file `/usr/share/applications/firefox.desktop`:
    * Change the line `Exec=/usr/lib/firefox/firefox %u` to `Exec=bash -c 'GTK_THEME=" " /usr/lib/firefox/firefox %u'`.
* For `libreoffice-TYPE`, where `TYPE` can be `base`, `calc`, etc., edit the file `/usr/share/applications/libreoffice-calc.desktop`
    * Change the first line containing the word `Exec`, with:
        * `Exec=bash -c 'GTK_THEME=Adwaita:light libreoffice --calc %U'`

## ssh-add
* To run `ssh-add`, you need to initialise the SSH-agent using:
    * `eval "$(ssh-agent)"`
## fn-key state
* pressing fn + esc will switch fn-key state
