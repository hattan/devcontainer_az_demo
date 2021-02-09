#!/usr/bin/env bash

copy_env_rc(){ 
    pushd /home/vscode/work
        cp /home/vscode/.local/.envrc .
        direnv allow
    popd
}

add_dir_env_to_bash_rc() {
    echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
}

main() {
    add_dir_env_to_bash_rc
    copy_env_rc
}

main