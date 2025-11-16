#!/bin/bash

if [ "$GITHUB_ACTIONS" = "true" ]; then
    TOOL="GitHub Actions"
elif [ "$CIRCLECI" = "true" ]; then
    TOOL="CircleCI"
elif [ "$BUILDKITE" = "true" ]; then
    TOOL="Buildkite"
else
    TOOL="Unknown CI"
fi

# Set timezone to Pacific Time and format as "MM/DD/YYYY hh:mm:ss AM/PM PDT"
BUILD_TIME=$(TZ=America/Los_Angeles date +"%m/%d/%Y %I:%M:%S %p %Z")

echo "Build successful!"
echo "Build Tool: $TOOL"
echo "Build Time (Pacific): $BUILD_TIME"
