#!/usr/bin/env bash

# Source the common.sh script
# shellcheck source=./common.sh
. "$(git rev-parse --show-toplevel || echo ".")/scripts/common.sh"

cd "$PROJECT_DIR" || exit 1
. ./scripts/stop.sh

echo_info "Spawning docker containers for your viewing pleasure"
docker run --rm -d -p 4567:4567 -p 35729:35729 -v "$PWD":/src/wiki \
    --name "gollum-$PROJECT_NAME" \
    gollum-reload


echo_info "View your wiki at http://localhost:4567"

EXIT_CODE=$?
cd "$WORKING_DIR" || exit 1
exit $EXIT_CODE
