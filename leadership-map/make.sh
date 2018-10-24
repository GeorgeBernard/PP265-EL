#! /bin/bash

# Input
NAMES='header intro my-story life-mission success-happiness-joy moral-fiber amoral-fiber
leadership-qualities twenties 3-year-plan senior-year closing'

# Processing
SRC_FILES=$(echo $NAMES | tr ' ' '\n' | sed 's/.*/src\/&.md/')

rm -rf tmp
mkdir tmp
awk '{print}' $SRC_FILES > tmp/leadership-map.md

pandoc \
  --output out/leadership-map.pdf \
  --table-of-contents             \
  --standalone                    \
  --number-sections               \
  tmp/leadership-map.md
