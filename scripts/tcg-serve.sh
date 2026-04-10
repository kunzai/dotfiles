#!/bin/bash

# Check if at least one parameter (project) is provided
if [ -z "$1" ]; then
  echo "Error: At least one parameter (project) is required."
  echo "Usage: $0 <project> [chart]"
  exit 1
fi

# Assign parameters to variables
project=$1
chart=$2

# Execute the command
pnpm run serve --env project="$project" --env chart="$chart"
