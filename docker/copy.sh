#!/usr/bin/env bash

file="$*"
subpath="${file%/*}"
mkdir -p "repo/$subpath"
cp -r "wiki/$file" "repo/$file"
