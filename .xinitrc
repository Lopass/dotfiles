if [ -e $HOME/.config/i3/config.base ]; then
	if [ -e $HOME/.config/i3/i3_work_cfg/config.work ]; then
		cat $HOME/.config/i3/config.base $HOME/.config/i3/i3_work_cfg/config.work > $HOME/.config/i3/config
	elif [ -e $HOME/.config/i3/config.local ]; then
		cat $HOME/.config/i3/config.base $HOME/.config/i3/config.local > $HOME/.config/i3/config
	else
		cat $HOME/.config/i3/config.base > $HOME/.config/i3/config
	fi
fi

systemctl --user set-environment DISPLAY=:0
systemctl restart --user dunst.service

exec i3
