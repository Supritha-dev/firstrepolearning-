#!/bin/bash

git status

git add .

git commit -m "Automated commit"

git push origin main

echo "Changes have been pushed to the remote repository."