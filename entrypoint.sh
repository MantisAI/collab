#!/bin/bash
set -e

exec jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root