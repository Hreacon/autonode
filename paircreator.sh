#!/bin/bash
echo "Pair file creation!"
function writeFile {
FILE=~/.pairs

# Was setup to enter both pairs name and intials
# echo "  $initial1: $name1" >> "$FILE"
# echo "  $initial1: $email1" >> "$FILE"

# now set to mine(Nicholas Jensen-Hay)
echo pairs: > ""$FILE""
echo "  njh: Nicholas Jensen-Hay" >> "$FILE"
echo "  $initial2: $name2" >> "$FILE"
echo email_addresses: >> "$FILE"
echo "  njh: nicholasjensenhay@gmail.com" >> "$FILE"
echo "  $initial2: $email2" >> "$FILE"

echo "$FILE" file written.
}

function collectInput {
clear
# echo First pairs initials, followed by enter
# read initial1
# clear
# echo First pairs name, followed by enter
# read name1
# clear
# echo First pairs email, followed by enter
# read email1
# clear
echo Enter pairs initials, followed by enter
read initial2
clear
echo Enter pairs name, followed by enter
read name2
clear
echo Enter pairs email, followed by enter
read email2
clear
}

FILE=~/.pairs
if [ -f "$FILE" ]
then
  echo File exists. Overwrite? y/n [lowercase answer, default NO ]
  read answer
  answer=${answer:-n}
  if [[ "$answer" == y* ]]
    then collectInput
    writeFile
  else echo Aborted
  fi
else collectInput
  writeFile
fi
