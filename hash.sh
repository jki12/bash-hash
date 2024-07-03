#!/bin/bash

cat << "EOF" # heredoc
 _               _           _     
| |             | |         | |    
| |__   __ _ ___| |__    ___| |__  
| '_ \ / _` / __| '_ \  / __| '_ \ 
| | | | (_| \__ \ | | |_\__ \ | | |
|_| |_|\__,_|___/_| |_(_)___/_| |_|

EOF

hash_list=("md5" "sha1")
max_len=32;

echo "+----------------------------------+"
find . -type f ! -name ".*" -print0 |  while IFS= read -d "" file
do
  if [[ "${file}" == "./hash.sh" ]]; then
    continue
  fi

  for hash in ${hash_list[@]}
  do
    hash_file="${file}.${hash}"
    printf "| %-*s |\n" ${max_len} "Created ${hash_file}"
    echo `openssl ${hash} "${file}"` | cut -d ' ' -f2 > "${hash_file}"
  done
done
echo "+----------------------------------+"