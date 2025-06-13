#!/bin/bash

set -e

# brew
brew tap brewforge/chinese
brew tap brewforge/extras

brew update
brew upgrade

brew install \
   alt-tab \
   bat \
   bat-extras \
   clash-verge-rev \
   fd \
   firefox \
   firefox@developer-edition \
   firefox@nightly \
   font-jetbrains-mono-nerd-font \
   forgit \
   fzf \
   git \
   git-delta \
   git-lfs \
   google-chrome \
   i4tools \
   iterm2 \
   jordanbaird-ice \
   karabiner-elements \
   klogg \
   lazygit \
   localsend \
   lookin \
   maccy \
   mas \
   monitorcontrol \
   mos \
   nomachine \
   openmtp \
   openinterminal \
   pipenv \
   qq \
   qqmusic \
   quickrecorder \
   rectangle \
   ripgrep \
   sensiblesidebuttons \
   snipaste \
   sourcetree \
   tencent-lemon \
   tencent-meeting \
   utools \
   virtualbuddy \
   visual-studio-code \
   wechat \
   wechatwork

# brew install eqmac

brew install --cask \
   squirrel \
   xcodes

# appstore apps
mas upgrade
mas install 6448461551 # Command X
mas install 1274495053 # Microsoft To Do