# MacOS workstation setup script

A shell script to setup a required minimum of basic tools for iOS and web development. Inspired by [laptop](https://github.com/thoughtbot/laptop) script by Thoughtbot.

## Compatibility

- macOS 10.13.5

## Installation

Clone repository, run script. You can run script multiple times if needed.

    bash mac.sh

## What it sets up

### System tools

- [Homebrew]( http://brew.sh/) for package management
- [Fish](https://fishshell.com) as a default shell
- [Tmux](http://tmux.github.io/) for more effective terminal applications management

### Version control

- [Git](https://git-scm.com/) for version control
- [Sourcetree](https://www.sourcetreeapp.com) as GUI for Git

### General

- [VS Code](https://code.visualstudio.com) for text editing
- [Postman](https://www.getpostman.com) for remote API communication
- [Hugo](https://gohugo.io) for static site generation
- [Surge](https://surge.sh) for static site hosting

### iOS

- [Cocoapods](https://cocoapods.org) for managing iOS libraries
- [SwiftLint](https://github.com/realm/SwiftLint) for code style check
- [Generamba](https://github.com/ladeiko/Generamba) for boilerplate code generation

### JS

- [Node.js](https://nodejs.org/en/) as Javascript runtime
- [Yarn](https://yarnpkg.com/en/) for managing Javascript packages
- [ESLint](https://eslint.org) for syntax style check

### Ruby

- [Bundler](http://bundler.io/) for managing Ruby libraries
- [Specific Install](https://github.com/rdp/specific_install) to install gem straight from its github repository
