{
 description = "NixOS Infinix x2 Niri + Noctalia + Glass SDDM";
 
 inputs = {
	#untuk wayland rekomended unstable
	nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	niri.url = "github:sodiboo/niri-flake";	

	#quickshell = {
	#	url = "https://git.outfoxxed.me/outfoxxed/quickshell";
	#	inputs.nixpkgs.follows = "nixpkgs";
	#};

	# home manager
	home-manager = {
		url = "github:nix-community/home-manager";
		inputs.nixpkgs.follows = "nixpkgs";
	};
	dms = {
		url = "github:AvengeMedia/DankMaterialShell/stable";
		inputs.nixpkgs.follows = "nixpkgs";
	};
 };
 outputs = { self, nixpkgs, niri, home-manager, dms, ... } @inputs: {
	nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
		specialArgs = {inherit inputs;};
		modules = [
			./configuration.nix




			home-manager.nixosModules.home-manager
			{
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				home-manager.extraSpecialArgs = {inherit inputs;};


				home-manager.users.kunix = ({ pkgs, config, inputs, ... }: import ./home.nix { inherit pkgs config inputs; });
			}
			

		];
	};
 };

}
