montana:
	sudo nixos-rebuild switch --flake .#montana
montana-home:
	home-manager switch --flake .#olivia@montana
montana-full:
	sudo nixos-rebuild switch --flake .#montana && home-manager switch --flake .#olivia@montana
salmo:
	sudo nixos-rebuild switch --flake .#salmo
salmo-home:
	home-manager switch --flake .#olivia@salmo
salmo-full:
	sudo nixos-rebuild switch --flake .#salmo && home-manager switch --flake .#olivia@salmo
gc:
	nix-collect-garbage
