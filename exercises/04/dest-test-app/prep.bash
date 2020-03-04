#!/usr/bin/env bash

# Prepares the app archive and manifest for upload:
# - removes previous app archive
# - creates app archive from core files
# - copies the archive and manifest to the accessible Chrome OS
#   download folder, ready for upload via the Cockpit

rm app.zip
zip app.zip .npmrc package.json xs-app.json
cp manifest.yml app.zip ${HOME}/Downloads/
