#! /usr/bin/env bash
# Check that the daemon command exist
if ! command -v picom 2> /dev/null; then
	echo "picom not found. Exiting"
	exit 1
fi

# Kill picom if it is already running
killall picom 2> /dev/null

if [ !$(picom &) ]; then
	echo "Picom cannot be launched. Exiting"
	exit 1
fi
