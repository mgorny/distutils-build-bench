#!/bin/bash

for x in {1..5}; do
	time -p (
		if [[ 2 -eq $(find '(' -name '*.c' -o -name '*.cc' -o -name '*.cpp' \
			-o -name '*.cxx' -o -name '*.c++' -o -name '*.m' \
			-o -name '*.mm' -o -name '*.pyx' ')' -printf '\n' |
			head -n 2 | wc -l) ]]
		then
			python3.12 setup.py build_ext -j12 &> /dev/null
		fi
	)
	time -p ( python3.12 -m build -nwx &> /dev/null )
	git clean -dfxq
done
