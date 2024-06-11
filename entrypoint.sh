#!/usr/bin/env bash

set -e

groupadd -g $APP_GROUP $APP_GROUPNAME || echo "exist"
useradd -m -s /bin/bash -u $APP_USER -g $APP_GROUP $APP_USERNAME || echo "exist"

exec "$@"