# pierdolnik-mc

Clone to `/var/pierdolnik`

	podman play kube kubernetes.yml
	sudo loginctl enable-linger $USER
	mkdir -p ~/.config/systemd/user
	podman generate systemd -f --name pierdolnik
	systemctl --user daemon-reload
	systemctl --user enable pod-pierdolnik.service
