#!/bin/bash
set -euo pipefail

SEARCH_PATTERN="$1"
OUTPUT="$2"

curl https://gist.githubusercontent.com/StevenClontz/4445774/raw/1722a289b665d940495645a5eaaad4da8e3ad4c7/mobydick.txt > mobydick.txt

OCCURRENCES=$(grep -o "$SEARCH_PATTERN" mobydick.txt | wc -l)

echo "The search pattern $SEARCH_PATTERN was found $OCCURRENCES time(s)." > "$OUTPUT"


# grep: Prints the whole line, Prints the line once regardless of how many times the pattern appears
# grep -o: Prints only the matched text, Prints each individual match on a separate new line

################ optional challenges:

# SEARCH_PATTERN="$1"

# # challenge A
# if [[ $# -ge 2 ]]; then
#     OUTPUT="$2"
# else
#     OUTPUT="results.txt"
# fi

# # challenge B
# if [[ -e "$OUTPUT" ]]; then
#     echo "Error: output file '$OUTPUT' already exists."
#     exit 1
# fi

# curl https://gist.githubusercontent.com/StevenClontz/4445774/raw/1722a289b665d940495645a5eaaad4da8e3ad4c7/mobydick.txt > mobydick.txt

# # challenge D
# OCCURRENCES=$(grep -oi "$SEARCH_PATTERN" mobydick.txt | wc -l)

# echo "The search pattern $SEARCH_PATTERN was found $OCCURRENCES time(s)." > "$OUTPUT"
# echo "" >> "$OUTPUT"

# # challenge C + D
# echo "Lines where the search pattern was found:" >> "$OUTPUT"
# grep -in "$SEARCH_PATTERN" mobydick.txt | cut -d: -f1 >> "$OUTPUT"
