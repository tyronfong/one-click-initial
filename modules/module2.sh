#!/usr/bin/env bash

echo "here is module2"

# description
export `basename ${BASH_SOURCE[0]} .sh`_desc="pls complete the brief description of module2"

# init function (should start with "filename_")
function demo2_init()
(
    echo "module2 init start"
    echo "."
    echo "."
    echo "do something here..."
    echo "."
    echo "."
    echo "module2 init finished successfully"
)