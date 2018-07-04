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

update_shell() {
  local shell_path;
  shell_path="$(command -v fish)"

  fancy_echo "Changing default shell to fish ..."
  if ! grep "$shell_path" /etc/shells > /dev/null 2>&1 ; then
    fancy_echo "Adding '$shell_path' to /etc/shells"
    sudo sh -c "echo $shell_path >> /etc/shells"
  fi
  sudo chsh -s "$shell_path" "$USER"
}

if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew ..."
  curl -fsS 'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby
fi

fancy_echo "Updating Homebrew formulae ..."
brew update --force # https://github.com/Homebrew/brew/issues/1151
brew bundle --file=- <<EOF
tap "homebrew/services"
tap "caskroom/cask"

brew "fish"
brew "git"
brew "tmux"
brew "node"
brew "yarn"
brew "hugo"

cask "visual-studio-code"
cask "sourcetree"
cask "docker-toolbox"
cask "postman"
EOF

fancy_echo "Installing Ruby gems ..."
gem_install_or_update "bundler"
gem_install_or_update "cocoapods"

fancy_echo "Installing global JS packages ..."
yarn global add eslint
yarn global add surge

update_shell
