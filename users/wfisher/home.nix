{ pkgs, ...}:
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

	home.packages = with pkgs; [
    	gh
	    google-chrome
	    gnome3.gnome-tweaks
		spotify
		discord
	];

	home.stateVersion = "24.11";
	programs.home-manager.enable = true;
}
