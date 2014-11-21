#!/bin/sh

(sleep 1; \
	wm-autostart.sh
) &

exec ratpoison

