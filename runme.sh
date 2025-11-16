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

# Get timestamp in safe filename format: YYYYMMDDTHHMMSSZ
BUILD_TIME=$(date -u +"%Y%m%dT%H%M%SZ")

# Compose artifact filename
ARTIFACT_NAME="artifact_${BUILD_TIME}.txt"

# Write artifact to repo root
echo "CI build successful" > "$ARTIFACT_NAME"
echo "Build Time: $BUILD_TIME" >> "$ARTIFACT_NAME"
echo "Build Tool: $TOOL" >> "$ARTIFACT_NAME"

echo "Build done. Artifact is $ARTIFACT_NAME"
