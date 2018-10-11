#!/bin/bash -ex

for doc in $@; do
  docpath=$(realpath $doc)
  name=$(basename ${docpath%.*})

  pandoc -f docx -t markdown_mmd --output=$name.md --atx-headers --wrap=none --toc --extract-media="" $docpath 
done
