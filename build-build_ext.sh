#!/bin/bash

for x in {1..5}; do
	time -p ( python3.12 setup.py build_ext -j12 &> /dev/null )
	time -p ( python3.12 -m build -nwx &> /dev/null )
	git clean -dfxq
done
