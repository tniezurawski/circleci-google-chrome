# Circleci Use Chrome Stable Version

To force the use of the latest stable version of Chrome on Circle CI, define those lines in your circle.yml configuration file and set environmental variable `$USE_LATEST_CHROME=true`.

```
steps:
  - restore_cache:
      key: v1-repo-{{ .Environment.CIRCLE_SHA1 }}
  # download the latest Google Chrome if enabled by environmental variable $USE_LATEST_CHROME
  - run:
      name: Install the latest Google Chrome
      command: |
        if [[ $USE_LATEST_CHROME == true ]]; then if test -f "$HOME/downloads/use_chrome_stable_version.sh"; then sh $HOME/downloads/use_chrome_stable_version.sh; else curl -o $HOME/downloads/use_chrome_stable_version.sh --create-dirs https://raw.githubusercontent.com/tniezurawski/circleci-google-chrome/master/use_chrome_stable_version.sh && bash $HOME/downloads/use_chrome_stable_version.sh; fi; fi;
```
