{
  packageOverrides = pkgs: with pkgs; {
    devpodPackages = pkgs.buildEnv {
      name = "rwades-tools";
      paths = [
        neovim
	bat
	delta
        go
        starship
        fd
        ripgrep
        tmux
        lazygit
        kubectl
        k9s
	zsh
	git
      ];
    };
  };
}
