#!/bin/bash
set -e

if [ "$1" = "jupyter" ]; then
    exec jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root
else
    exec "$@"
fi