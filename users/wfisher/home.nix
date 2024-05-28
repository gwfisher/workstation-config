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

	programs.steam = {
  		enable = true;
  		remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  		dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
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
		
	];

	home.stateVersion = "24.11";
	programs.home-manager.enable = true;
	
}
