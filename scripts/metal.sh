if [[ $# -eq 0 ]]; then
    echo "Specify 1 or 0 as an argument to enable or disable Metal HUD"
    exit 1
fi

if [[ $1 -eq 1 ]]; then
	/bin/launchctl setenv MTL_HUD_ENABLED 1
    echo "Metal HUD enabled"
else
	/bin/launchctl setenv MTL_HUD_ENABLED 0
    echo "Metal HUD disabled"
fi
