#!/bin/bash

if [[ -d "/build/res" ]]; then
    rm "/build/res"
fi

cp -r res build/
