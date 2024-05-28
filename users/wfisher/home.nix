{ config, pkgs, ...}:
{
	home.username = "wfisher";
	home.homeDirectory = "/home/wfisher";

	imports = [
		./modules/ssh
	];

	programs.zsh = {
		enable = true;
	};

	programs.kitty = {
		enable = true;
	};
	
	programs.vscode = {
		enable = true;
	};

	programs.gpg = {
		enable = true;
		agent = {
			enable = true;
			pinentryPackage = "gnome3";
		};
	};

	home.packages = with pkgs; [
    	gh
	    google-chrome
	    gnome3.gnome-tweaks
		spotify
		discord
		pipx
		obsidian
		prismlauncher
		gimp
		
	];

	home.stateVersion = "24.11";
	programs.home-manager.enable = true;
	
}
