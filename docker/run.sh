#!/bin/bash

# Print a trace of simple command. Helpful for debugging.
set -x

cd /src

pid=0

shutdown() {
  # kill and wait for gollum to exit
  kill -SIGTERM "$gollum_pid"
  wait $gollum_pid

  # kill and wait for guard to exit
  kill -SIGTERM "$guard_pid"
  wait $guard_pid

  # now exit this scripts
  exit 143 # 128 + 15 -- SIGTERM
}

# catch and handle SIGTERM with our handler
trap 'shutdown' SIGTERM

# Create a dummy user to please git when we commit
git config --global user.email "root@gollum-container"
git config --global user.name "Root in gollum container"

# Copy the wiki folder into our intenral repo
cp -a wiki repo

# Now initialize git repository for gollum to work with
cd /src/repo
rm -rf .git
git init
git add .
git commit -m "Init"

# Start gollum in the background and record its pid to stop it once we receive
# SIGNTERM from docker
gollum --no-live-preview --js --no-edit --emoji /src/repo &
gollum_pid=$!

# And finaly, start guard to watch for wiki changes, also record its pid
cd /src && guard --no-interactions &
guard_pid=$!

wait $guard_pid
wait $gollum_pid
