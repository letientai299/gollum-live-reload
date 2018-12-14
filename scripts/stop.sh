#!/usr/bin/env bash

# Source the common.sh script
# shellcheck source=./common.sh
. "$(git rev-parse --show-toplevel || echo ".")/scripts/common.sh"

cd "$PROJECT_DIR" || exit 1

if [[ -n $(docker ps -f "name=gollum-$PROJECT_NAME" -q) ]]; then
    echo_info "Stop previous gollum containers"
    docker exec -it "gollum-$PROJECT_NAME" pkill gollum
    docker exec -it "gollum-$PROJECT_NAME" pkill guard
fi

cd "$WORKING_DIR" || exit 1
