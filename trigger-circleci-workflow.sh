#!/bin/sh

set -e

[ -z "$GITHUB_REPOSITORY" ] && {
	echo >&2 "Environment variable GITHUB_REPOSITORY is unset"
	exit 1
}
echo "GITHUB_REPOSITORY=$GITHUB_REPOSITORY"
echo "BRANCH_NAME=$BRANCH_NAME"

GITHUB_OWNER="$(echo "$GITHUB_REPOSITORY" | cut -f1 -d/)"
GITHUB_REPO="$(echo "$GITHUB_REPOSITORY" | cut -f2 -d/)"

echo "Triggering CircleCI workflow for the following. $GITHUB_OWNER/$GITHUB_REPO - $BRANCH_NAME"

curl -u "$CIRCLECI_TOKEN": \
	-X POST --header "Content-Type: application/json" \
	-d "{\"branch\":\"$BRANCH_NAME\"}" \
	"https://circleci.com/api/v1.1/project/github/$GITHUB_OWNER/$GITHUB_REPO/build"
