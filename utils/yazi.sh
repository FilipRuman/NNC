#!/usr/bin/env sh

set -eu

DIR="${1:-.}"

exec ghostty -e fish -ic "cd \"$DIR\"; and yazi; and exec fish"
