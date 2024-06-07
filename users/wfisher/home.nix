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
		oh-my-zsh = {
			enable = true;
			theme = "agnoster";
			plugins = [ "git" ];
		};
		shellAliases = {
			update = "sudo nixos-rebuild switch";
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
				tab_bar_edge = "top";
				tab_bar_style = "powerline";
				tab_powerline_style = "angled";
				allow_remote_control = "yes";
				shell_integration = "enabled";

		};
		extraConfig = "include ./nord.conf";
	};
	
	programs.vscode = {
		enable = true;
	};

	programs.neovim = {
		enable = true;
		viAlias = true;
		vimAlias = true;
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
