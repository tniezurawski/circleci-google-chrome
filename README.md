# Circleci Use Chrome Stable Version

To force the use of the latest stable version of Chrome on Circle CI, define those lines in your circle.yml configuration file and set enviromental variable $USE_LATEST_CHROME=true

```
dependencies:
  cache_directories:
  - '~/downloads'
pre:
  # download the latest Google Chrome if enabled by environmental variable $USE_LATEST_CHROME
  - if [[ $USE_LATEST_CHROME == true ]]; then if test -f "$HOME/downloads/use_chrome_stable_version.sh"; then sh $HOME/downloads/use_chrome_stable_version.sh; else curl -o $HOME/downloads/use_chrome_stable_version.sh --create-dirs https://raw.githubusercontent.com/tniezurawski/circleci-google-chrome/master/use_chrome_stable_version.sh && bash $HOME/downloads/use_chrome_stable_version.sh; fi; fi;
