#!/bin/bash

set -e

export ZIP_SRC_DIR=${ZIP_SRC_DIR:-/zip}
export ZIP_FILENAME=${ZIP_FILENAME:-function.zip}
export TRAVELING_RUBY_BASE_DIR="${ZIP_SRC_DIR}/lib"
export GEM="${TRAVELING_RUBY_BASE_DIR}/ruby/bin/gem"

export SUPPORTING_FILES_SRC=/workdir/supportingFiles
if [ -d "${SUPPORTING_FILES_SRC}" ] ; then
  echo "Copying supportingFiles"
  cp -r ${SUPPORTING_FILES_SRC} ${ZIP_SRC_DIR}
fi

echo "Copying Ruby source to zip output directory"
mkdir -p "${TRAVELING_RUBY_BASE_DIR}"
cp -rT "/workspace" "${TRAVELING_RUBY_BASE_DIR}"

echo "Copying previously downloaded Travelling Ruby"
cp -rT "/ruby" "${TRAVELING_RUBY_BASE_DIR}"

cd "${TRAVELING_RUBY_BASE_DIR}"
if [ -f "Gemfile" ] ; then
  echo "Installing packages with Bundler"
  BUNDLE_IGNORE_CONFIG=1 bundle install --path vendor --without development
fi

echo "Packagig ${ZIP_FILENAME}"
cd ${ZIP_SRC_DIR}
zip -r ${ZIP_FILENAME} index.js package.json ruby_entryscript lib supportingFiles

export ZIP_OUT_DIR=/output/${FUNCTION}
mkdir -p ${ZIP_OUT_DIR}
mv ${ZIP_FILENAME} ${ZIP_OUT_DIR}
