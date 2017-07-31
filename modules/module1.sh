#!/usr/bin/env bash

# description
export `basename ${BASH_SOURCE[0]} .sh`_desc="pls complete the brief description of module1"

# init function (should start with "filename_")
function module1_init()
(
    echo "module1 init start"
    echo "."
    echo "."
    echo "do something here..."
    echo "."
    echo "."
    echo "module1 init finished successfully"
)
