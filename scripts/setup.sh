#!/usr/bin/env bash

# Source the common.sh script
# shellcheck source=./common.sh
. "$(git rev-parse --show-toplevel || echo ".")/scripts/common.sh"

cd "$PROJECT_DIR" || exit 1

# Check if dep is available in path
if ! has docker; then
    echo_error "This setup script rely on docker to serve the wiki locally"
    exit 1
fi

echo_info "Build docker image"
docker build ./docker/ --tag gollum-reload

echo_info "Config git hooks pash"
git config core.hooksPath "$PROJECT_DIR/scripts/git-hooks"

cd "$WORKING_DIR" || exit 1
