#!/bin/bash

cat << "EOF" # heredoc
 _               _           _     
| |             | |         | |    
| |__   __ _ ___| |__    ___| |__  
| '_ \ / _` / __| '_ \  / __| '_ \ 
| | | | (_| \__ \ | | |_\__ \ | | |
|_| |_|\__,_|___/_| |_(_)___/_| |_|

EOF

max_len=32;

echo "+----------------------------------+"
file_list=(`ls -p | grep -v "/"`) # dir 파일 제외.

hash_list=('md5' 'sha1')
for file in "${file_list[@]}"
do
	if [[ "${file}" == "hash.sh" ]]; then
		continue
	fi

	for hash in ${hash_list[@]}
	do
		hash_file="${file}.${hash}"
		printf "| %-*s |\n" ${max_len} "created ${hash_file}"
		echo `openssl ${hash} ${file}` | cut -d ' ' -f2 > ${hash_file}
	done
done
echo "+----------------------------------+"