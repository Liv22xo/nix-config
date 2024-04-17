montana:
	sudo nixos-rebuild switch --flake .#montana
montana-home:
	home-manager switch --flake .#olivia@montana
montana-full:
	sudo nixos-rebuild switch --flake .#montana && home-manager switch --flake .#olivia@montana
