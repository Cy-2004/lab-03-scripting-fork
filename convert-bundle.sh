#!/bin/bash
set -euo pipefail

curl "https://s3.amazonaws.com/ds2002-resources/labs/lab3-bundle.tar.gz" > lab3-bundle.tar.gz

# Find the TSV file inside the archive
TSV_FILE=$(tar -tzf lab3-bundle.tar.gz | grep '\.tsv$')

echo "Found TSV file: $TSV_FILE"

# Extract the archive
tar -xzf lab3-bundle.tar.gz

# Remove blank lines
awk '!/^[[:space:]]*$/' "$TSV_FILE" > cleaned.tsv

# Convert tabs to commas
tr '\t' ',' < cleaned.tsv > converted.csv

# Count data rows, excluding the header
ROWS=$(($(wc -l < converted.csv) - 1))

echo "Data rows remaining: $ROWS"

# Repackage the CSV
tar -czf converted-archive.tar.gz converted.csv