function torch_activate
    set -gx LUA_PATH $HOME/.luarocks/share/lua/5.1/?.lua \
                    $HOME/.luarocks/share/lua/5.1/?/init.lua \
                    /usr/local/share/lua/5.1/?.lua \
                    /usr/local/share/lua/5.1/?/init.lua \
                    $HOME/torch/install/share/lua/5.1/?.lua \
                    $HOME/torch/install/share/lua/5.1/?/init.lua \
                    ./?.lua \
                    $HOME/torch/install/share/luajit-2.1.0-beta1/?.lua

    set -gx LUA_CPATH $HOME/.luarocks/lib/lua/5.1/?.so \
                    /usr/local/lib/lua/5.1/?.so \
                    ./?.so \
                    $HOME/torch/install/lib/lua/5.1/?.so \
                    /usr/local/lib/lua/5.1/loadall.so

    set -gx PATH $HOME/torch/install/bin $PATH
    set -gx LD_LIBRARY_PATH $HOME/torch/install/lib $LD_LIBRARY_PATH
    set -gx DYLD_LIBRARY_PATH $HOME/torch/install/lib $DYLD_LIBRARY_PATH
    set -gx LUA_CPATH $HOME/torch/install/lib/?.dylib $LUA_CPATH
end
