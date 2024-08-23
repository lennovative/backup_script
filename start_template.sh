#!/bin/bash
ROOT_DIR="path/to/root"
./backup.sh "$ROOT_DIR/dir1" $(pwd)
./backup.sh "$ROOT_DIR/dir2" $(pwd)
./backup.sh "$ROOT_DIR/dir3" $(pwd)
