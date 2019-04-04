#!/bin/sh

DIR=$(dirname "$(readlink -f $0)")
cd "$DIR"
find . -not -path './.git/*' -not -name .git -type d -exec mkdir -pv ~/{} \;
find . -not -path './.git/*' -type f -not -regex ".*\.?$(basename $0).*" -not -name '*keyboard*' -exec ln $1 -sv $DIR/{} ~/{} \;
