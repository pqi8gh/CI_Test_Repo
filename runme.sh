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

# Get UTC time in seconds
UTC_SECONDS=$(date -u +%s)

# Convert UTC to Pacific Time by subtracting 7 hours (25200 seconds)
# Note: This will be PDT (Daylight), for PST adjust as needed
PT_SECONDS=$((UTC_SECONDS - 25200))

# Format Pacific Time as MM/DD/YYYY hh:mm:ss AM/PM
BUILD_TIME=$(date -d "@$PT_SECONDS" +"%m/%d/%Y %I:%M:%S %p PDT")

echo "Build successful!"
echo "Build Tool: $TOOL"
echo "Build Time (Pacific): $BUILD_TIME"
