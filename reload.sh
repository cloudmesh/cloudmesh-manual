#!/bin/sh
exec <"$0" || exit; read v; read v; exec /usr/bin/osascript - "$@"; exit
 
tell application "Google Chrome"
    reload active tab of window 1
end tell




