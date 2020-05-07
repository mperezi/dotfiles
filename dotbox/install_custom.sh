#!/usr/bin/env bash

set -euo pipefail

RIPGREP_RELEASE_URL="https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep-11.0.2-x86_64-unknown-linux-musl.tar.gz"
TAG_RELEASE_URL="https://github.com/aykamko/tag/releases/download/v1.4.0/tag_linux_386.tar.gz"
BAT_RELEASE_URL="https://github.com/sharkdp/bat/releases/download/v0.12.1/bat-v0.12.1-x86_64-unknown-linux-musl.tar.gz"
FD_RELEASE_URL="https://github.com/sharkdp/fd/releases/download/v7.4.0/fd-v7.4.0-x86_64-unknown-linux-musl.tar.gz"
SHELLCHECK_RELEASE_URL="https://github.com/koalaman/shellcheck/releases/download/v0.7.1/shellcheck-v0.7.1.linux.x86_64.tar.xz"
GIT_DELTA_RELEASE_URL="https://github.com/dandavison/delta/releases/download/0.1.1/delta-0.1.1-x86_64-unknown-linux-musl.tar.gz"

install_autojump() {
	echo "Installing autojump..."
	cd /tmp
	git clone git://github.com/wting/autojump.git
	cd autojump
	SHELL=$(command -v zsh) ./install.py -s
}

install_ripgrep() {
	echo "Installing ripgrep..."
	curl -sL $RIPGREP_RELEASE_URL |
	tar xzf - \
		-C /usr/local/bin \
		--strip-components=1 \
		ripgrep-11.0.2-x86_64-unknown-linux-musl/rg
}

install_tag() {
	echo "Installing tag..."
	curl -sL $TAG_RELEASE_URL |
	tar xzf - \
		-C /usr/local/bin tag
}

install_bat() {
	echo "Installing bat..."
	curl -sL $BAT_RELEASE_URL |
	tar xzf - \
		-C /usr/local/bin \
		--strip-components=1 \
		bat-v0.12.1-x86_64-unknown-linux-musl/bat
}

install_fd() {
	echo "Installing fd..."
	curl -sL $FD_RELEASE_URL |
	tar xzf - \
		-C /usr/local/bin \
		--strip-components=1 \
		fd-v7.4.0-x86_64-unknown-linux-musl/fd
}

install_yamllint() {
	echo "Installing yamllint..."
	pip3 install yamllint
}

install_shellcheck() {
	echo "Installing shellcheck..."
	apk add xz
	curl -sL $SHELLCHECK_RELEASE_URL |
	tar xJf - \
		-C /usr/local/bin \
		--strip-components=1 \
		shellcheck-v0.7.1/shellcheck
}

install_git_delta() {
	echo "Installing git-delta..."
	curl -sL $GIT_DELTA_RELEASE_URL |
	tar xzf - \
		-C /usr/local/bin \
		--strip-components=1 \
		delta-0.1.1-x86_64-unknown-linux-musl/delta
}

install_autojump
install_ripgrep
install_tag
install_bat
install_fd
install_yamllint
install_shellcheck
install_git_delta
