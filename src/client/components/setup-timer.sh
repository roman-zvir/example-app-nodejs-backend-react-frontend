#!/bin/bash

set -e  # Exit if any command fails

echo "Starting..."

npm cache clean --force
yarn cache clean

echo "Cleaning before npm..."
rm -rf node_modules package-lock.json yarn.lock

echo "Running npm install..."
start=$(date +%s.%N)
npm install
end=$(date +%s.%N)
npm_time=$(echo "$end - $start" | bc)

echo "Cleaning before yarn..."
rm -rf node_modules package-lock.json yarn.lock

echo "Running yarn install..."
start=$(date +%s.%N)
yarn install
end=$(date +%s.%N)
yarn_time=$(echo "$end - $start" | bc)

echo "Done!"
echo "NPM: ${npm_time}s"
echo "Yarn: ${yarn_time}s"

