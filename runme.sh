#!/bin/bash
set -e

# Detect CI tool
if [ "$GITHUB_ACTIONS" = "true" ]; then
    TOOL="GitHub Actions"
elif [ "$CIRCLECI" = "true" ]; then
    TOOL="CircleCI"
elif [ "$BUILDKITE" = "true" ]; then
    TOOL="Buildkite"
else
    TOOL="Unknown CI"
fi

# Current UTC time
BUILD_TIME=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Output to artifact
echo "CI build successful" > result.txt
echo "Build Time: $BUILD_TIME" >> result.txt
echo "Build Tool: $TOOL" >> result.txt

echo "Build done. Artifact is result.txt"
