#!/bin/bash

cat > /tmp/config <<-EOF
	[build_ext]
	parallel = 12
EOF
export DIST_EXTRA_CONFIG=/tmp/config

for x in {1..5}; do
	time -p ( python3.12 -m build -nwx &> /dev/null )
	git clean -dfxq
done
