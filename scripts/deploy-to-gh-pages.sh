#!/bin/bash

# Exit with nonzero exit code if anything fails.
set -e

git config user.name "Andrey Chibisov"
git config user.email "chibisoff27@gmail.com"

echo "Start to deploy..."

git checkout --orphan master
ls -l

git --work-tree ./dist add --all
git --work-tree ./dist commit -m "Deploy to GitHub Pages"
git push -f origin HEAD:master
rm -r dist

git checkout -f master
git branch -D master

echo "Successfully deployed"