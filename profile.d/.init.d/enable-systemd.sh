#! /bin/sh
if [ $(genie -b) != "inside" ]; then
	genie -s
fi
