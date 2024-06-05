{ config, pkgs, ...}:
{
	home.username = "wfisher";
	home.homeDirectory = "/home/wfisher";

	imports = [
		./modules/ssh
	];

	programs.zsh = {
		enable = true;
		enableCompletion = true;
		ohMyZsh = {
			enable = true;
      		autosuggestions.enable = true;
      		zsh-autoenv.enable = true;
      		syntaxHighlighting.enable = true;
      		oh-my-zsh = {
         		enable = true;
         		theme = "agnoster";
         		plugins = [
           			"git"
           			"history"
				];
			};
		};
	};

	home.sessionVariables = rec {
		GPG_TTY="$( tty )";
	};

	programs.kitty = {
		enable = true;
		settings = {
				font_family = "Inconsolata";
				font_size = "12";
		};
		extraConfig = "include ./nord.conf";
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
		pipx
		obsidian
		prismlauncher
		gimp
		unzip
		zstd
		
	];

	home.stateVersion = "24.11";
	programs.home-manager.enable = true;
	
}
