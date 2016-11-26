#!/bin/bash

use_chrome_stable_version() {
  echo 'Upgrading the current Chrome version:';
  google-chrome --version
  cd $HOME/downloads
  if ! test -f "google-chrome.deb"
  then
    curl -L -o google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb;
  fi
  sudo dpkg -i google-chrome.deb;
  sudo sed -i 's|HERE/chrome\"|HERE/chrome\" --disable-setuid-sandbox|g' /opt/google/chrome/google-chrome;
  echo 'The latest Chrome version is:';
  google-chrome --version
}

use_chrome_stable_version
