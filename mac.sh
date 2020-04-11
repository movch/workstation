#!/bin/sh

set -e

fancy_echo() {
  local fmt="$1"; shift
  printf "\\n$fmt\\n" "$@"
}

gem_install_or_update() {
  if gem list "$1" --installed > /dev/null; then
    sudo gem update "$@"
  else
    sudo gem install "$@"
  fi
}

if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew ..."
  curl -fsS 'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby
fi

fancy_echo "Updating Homebrew formulae ..."
brew update --force # https://github.com/Homebrew/brew/issues/1151
brew bundle --file=- <<EOF
tap "homebrew/services"

brew "git"
brew "vim"

brew "swiftlint"
brew "swiftformat"

brew "hugo"

cask "visual-studio-code"
cask "cocoarestclient"
cask "fork"
cask "figma"

cask "chromium"
cask "iina"
EOF

fancy_echo "Installing Ruby gems ..."
gem_install_or_update "bundler"
gem_install_or_update "cocoapods"
gem_install_or_update "fastlane"

fancy_echo "Installing dotfiles ..."
current_dir=$PWD
cd ./dotfiles/
source install.sh
cd $current_dir

fancy_echo "Installing Oh My ZSH ..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true

fancy_echo "Installing zsh-autosuggestions plugin ..."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions