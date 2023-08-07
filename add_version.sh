#!/bin/bash

# Check that exactly two parameters are provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <VERSION_INFO>"
  exit 1
fi

# Get the values from the command-line parameters
VERSION_INFO="$1"

# Path to the template file
TEMPLATE_FILE="aster_pkginfo.pytmpl"

# Output file
OUTPUT_FILE="pkginfo.py"

# Use sed to replace the placeholders with the actual values
sed -e "s|@VERSION_INFO@|$VERSION_INFO|g" \
    $TEMPLATE_FILE > $OUTPUT_FILE

echo "pkginfo.py has been created!"
