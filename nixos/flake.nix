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
	#
	# noctalia shells
#	noctalia = {
#		url = "github:noctalia-dev/noctalia-shell";
#		inputs.nixpkgs.follows = "nixpkgs";
#	};	
 };
 outputs = { self, nixpkgs, niri, home-manager, ... } @inputs: {
	nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
		specialArgs = {inherit inputs;};
		modules = [
			./configuration.nix
			niri.nixosModules.niri

			{
				programs.dms-shell = {
				    enable = true;

				    # Opsional: Fitur tambahan
				    systemd.enable = true;                # Auto-start via systemd
				    systemd.restartIfChanged = true;      # Restart otomatis kalau config berubah
				    enableSystemMonitoring = true;        # Widget monitoring (CPU/RAM)
				    enableClipboard = true;               # Clipboard history
				    enableVPN = true;                     # Widget VPN
				    enableDynamicTheming = true;          # Theming berdasarkan wallpaper (matugen)
				    enableAudioWavelength = true;         # Visualizer audio (cava)
				    enableCalendarEvents = true;          # Integrasi kalender
				};
			}

			home-manager.nixosModules.home-manager
			{
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				home-manager.extraSpecialArgs = {inherit inputs;};


				home-manager.users.kunix = import ./home.nix;
			}
			
			{ nixpkgs.overlays = [niri.overlays.niri]; }
		];
	};
 };

}
