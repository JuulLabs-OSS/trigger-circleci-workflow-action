#!/bin/sh

set -eu

GITHUB_OWNER="$(echo "$GITHUB_REPOSITORY" | cut -f1 -d/)"
GITHUB_REPO="$(echo "$GITHUB_REPOSITORY" | cut -f2 -d/)"
GITHUB_BRANCH="$(echo "$GITHUB_REF" | cut -c 12-)"

echo "Triggering CircleCI workflow for the following. $GITHUB_OWNER/$GITHUB_REPO - $GITHUB_BRANCH"

curl -u "$CIRCLE_TOKEN": \
	-X POST --header "Content-Type: application/json" \
	-d "{""branch"":""$GITHUB_BRANCH""}" \
	"https://circleci.com/api/v1.1/project/github/$GITHUB_OWNER/$GITHUB_REPO/build"
