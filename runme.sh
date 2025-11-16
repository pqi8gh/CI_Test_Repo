#!/bin/bash
set -e

if [ "$GITHUB_ACTIONS" = "true" ]; then
    TOOL="GitHub Actions"
elif [ "$CIRCLECI" = "true" ]; then
    TOOL="CircleCI"
elif [ "$BUILDKITE" = "true" ]; then
    TOOL="Buildkite"
else
    TOOL="Unknown CI"
fi

# Timestamp YYYYMMDDTHHMMSSZ
BUILD_TIME=$(date -u +"%Y%m%dT%H%M%SZ")
ARTIFACT_FILE="artifact_${BUILD_TIME}.txt"

echo "Build Complete: $BUILD_TIME" > "$ARTIFACT_FILE"
echo "Build Tool: $TOOL" >> "$ARTIFACT_FILE"
echo "This artifact confirms build success at $BUILD_TIME with $TOOL." >> "$ARTIFACT_FILE"

echo "Artifact created: $ARTIFACT_FILE"
