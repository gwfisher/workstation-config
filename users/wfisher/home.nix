{
	programs.zsh = {
		enable = true;
	};

	programs.kitty = {
		enable = true;
	};
	
	programs.vscode = {
		enable = true;
	};

	environment.systemPackages = with pkgs; [
    	gh
	    google-chrome
	    gnome3.gnome-tweaks
	];

	home.stateVersion = "24.11";
	programs.home-manager.enable = true;
}
