#!/bin/sh
echo -ne '\033c\033]0;SunsetDrifter\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/parralax_prototype.x86_64" "$@"
