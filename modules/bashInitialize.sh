#!/usr/bin/env bash

# description
export `basename ${BASH_SOURCE[0]} .sh`_desc="Initialize bash env, alias, etc."

# init function (should start with "filename_")
function bashInitialize_init()
(
    echo "bash env initialize..."

    ALIAS=("alias ..='cd ..'"
           "alias ...='cd ../../'"
           "alias ....='cd ../../../'"
           "alias .....='cd ../../../../'")

    if ! cat ~/.bashrc | grep -Eqi "alias ..="; then
        echo "alias.. not exist!"
    fi
)
