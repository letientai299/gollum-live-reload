#!/bin/bash

cd /src

git config --global user.email "root@gollum-container"
git config --global user.name "Root in gollum container"

cp -a wiki repo

cd /src/repo
rm -rf .git
git init
git add .
git commit -m "Init"

nohup gollum --no-live-preview --js --no-edit --emoji /src/repo &

cd /src && guard --no-interactions
