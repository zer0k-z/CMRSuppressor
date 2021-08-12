# CMultiplayRules Console Suppressor


![Downloads](https://img.shields.io/github/downloads/zer0k-z/CMRSuppressor/total?style=flat-square) ![Last commit](https://img.shields.io/github/last-commit/zer0k-z/CMRSuppressor?style=flat-square) ![Open issues](https://img.shields.io/github/issues/zer0k-z/CMRSuppressor?style=flat-square) ![Closed issues](https://img.shields.io/github/issues-closed/zer0k-z/CMRSuppressor?style=flat-square) ![Size](https://img.shields.io/github/repo-size/zer0k-z/CMRSuppressor?style=flat-square) ![GitHub Workflow Status](https://img.shields.io/github/workflow/status/zer0k-z/CMRSuppressor/Compile%20with%20SourceMod?style=flat-square)

## Description ##
**Note**: Only works for CS:GO!

Suppress CMultiplayRules constructor messages in console, which are a massive list of convars and their default value being printed to console every map change. 

This exists because [Cleaner](https://github.com/Accelerator74/Cleaner) doesn't seem to have regex, so this will do.

On Linux, some messages will not be seen by SourceMod and MetaMod. Use [this](https://git.csrd.science/nosoop/py-str0patch) on `bin/steamclient.so` along with this plugin and Cleaner for the cleanest console output.

## Requirements ##
- Sourcemod and Metamod


## Installation ##
1. Grab the latest release from the release page and unzip it in your `csgo` folder.
2. Restart the server or type `sm plugins load cmrsuppressor` in the console to load the plugin.
