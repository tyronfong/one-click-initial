#!/usr/bin/env bash

# description
export `basename ${BASH_SOURCE[0]} .sh`_desc="Initialize bash env, alias, etc."

# init function (should start with "filename_")
function bashInitialize_init()
(
    echo "bash env initialize..."

    if ! cat ~/.bashrc | grep -Eqi "alias \.\.="; then
        echo "alias ..='cd ..'" >> ~/.bashrc
	echo "apend alias ..='cd ..' to .bashrc file"
    fi

    echo "Bash env initialized successfully, pls re-login the bash to active."
    source ~/.bashrc
)
