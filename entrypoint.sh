#!/usr/bin/env bash
set -e

bin/rails db:setup

exec "$@"
