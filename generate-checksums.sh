#!/bin/bash
# Generate SHA256 checksums for all .run packages
# Usage: ./generate-checksums.sh

set -e

CHECKSUM_FILE="SHA256SUMS"
> "$CHECKSUM_FILE"

find . -name "*.run" -type f | sort | while read -r file; do
    sha256sum "$file" >> "$CHECKSUM_FILE"
done

echo "Generated $CHECKSUM_FILE with $(wc -l < "$CHECKSUM_FILE") entries"
cat "$CHECKSUM_FILE"
