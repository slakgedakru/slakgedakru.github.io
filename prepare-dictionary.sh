#!/bin/bash
# This is a ridiculously hacky script to pull down the entire trigedasleng lexicon and format it as Arise webpages.

# Pull down only the dictionary folder from the lexicon
mkdir trigedasleng
cd trigedasleng
git init
git remote add -f origin https://github.com/slakgedakru/trigedasleng
git config core.sparseCheckout true
echo "dictionary/" >> .git/info/sparse-checkout
git pull origin main 
mv dictionary ../
cd ../
rm -rf trigedasleng

# Build an Arise webpage out of each json file
# Warning: There are thousands of files, so this takes fucking forever.
for file in dictionary/*.json
do

word=""
class=""
translation=""
etymology="unknown"
filter="noncanon"
word="$(jq -r ".word" "$file")"
class="$(jq -r ".class" "$file")"
translation="$(jq -r ".translation" "$file")"
etymology="$(jq -r ".etymology" "$file")"
filter="$(jq -r ".filter" "$file")"

mkdir "dictionary/$word"
cat >> "dictionary/$word/index.md" <<EOF
<!-- BEGIN ARISE ------------------------------
Title:: "$word"

Author:: ""
Description:: "$translation"
Language:: "en"
Thumbnail:: ""
Published Date:: "2023-04-01"
Modified Date:: "$(date --iso)"

---- END ARISE \\ DO NOT MODIFY THIS LINE ---->

# $word ($class)

$translation

### Etymology

$etymology

### Source

$filter
EOF

# Removes json source file safely
rm "dictionary/$(basename "$file")"

done
