#!/usr/local/bin/elvish
git submodule update --init --recursive
var config-home = ({
    if (has-env XDG_CONFIG_HOME) {
        put (get-env XDG_CONFIG_HOME)
    } else {
        put {~/.config}
    }
})

ls -A .config | each { |dir| ln -sf $pwd/.config/$dir $config-home }

ln -s $pwd/.doom.d ~
ln -s $pwd/.tmux ~
ln -s $pwd/.tmux/.tmux.conf ~

