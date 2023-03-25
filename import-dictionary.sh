#!/bin/bash
# This is a ridiculously hacky script to pull down the entire trigedasleng lexicon and format it as Arise webpages.

# Helper function to help us clean up reserved characters when we're building our site
function clean_xml_string() (
  input_string="$1"
  # replace & with &amp;
  input_string=${input_string//\&/\&38;}
  # replace < with &lt;
  input_string=${input_string//</\&60;}
  # replace > with &gt;
  input_string=${input_string//>/\&62;}
  # replace ' with &apos;
  input_string=${input_string//\'/\&39;}
  # replace " with &quot;
  input_string=${input_string//\"/\&34;}
  echo "$input_string"
)

# Helper function to clean word folder names for URLs
function clean_url_string() (
  input_string="$1"
  input_string=${input_string// /_}
  input_string=${input_string//\&/-}
  input_string=${input_string//</-}
  input_string=${input_string//>/-}
  input_string=${input_string//\'/-}
  input_string=${input_string//\"/-}
  echo "$input_string"
)

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
note=""
note="$(jq -r ".note" "$file")"
etymology="$(jq -r ".etymology" "$file")"
filter="$(jq -r ".filter" "$file")"

word_nospaces=""
word_nospaces="$(clean_url_string "$word")"
mkdir "arise-source/dictionary/$word_nospaces"
cat >> "arise-source/dictionary/$word_nospaces/index.md" <<EOF
<!-- BEGIN ARISE ------------------------------
Title:: "$(clean_xml_string "$word")"

Author:: ""
Description:: "$(clean_xml_string "$translation")"
Language:: "en"
Thumbnail:: ""
Published Date:: ""
Modified Date:: ""

rss_hide:: "true"
content_header:: "false"
---- END ARISE \\ DO NOT MODIFY THIS LINE ---->

# $word ($class)

$translation
$([[ -n $note ]] && echo -e "\n### Notes\n\n$note")

### Etymology

$etymology

### Source

$filter
EOF

done
