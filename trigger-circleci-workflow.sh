#!/bin/bash

set -eu

curl -u "$CIRCLE_TOKEN": \
	-X POST --header "Content-Type: application/json" \
	-d "{""branch"":""$GITHUB_BRANCH""}" \
	"https://circleci.com/api/v1.1/project/github/$GITHUB_OWNER/$GITHUB_REPO/build"
