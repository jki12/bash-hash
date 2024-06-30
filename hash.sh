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
file_list=(`ls`)
len=${#file_list[@]} # file list length.

hash_list=('md5' 'sha1')
for i in `seq -w 0 $((len - 1))` # script 파일 제외, 범위를 [0, len - 1)로 하기 위해.
do
	if [[ "${file_list[i]}" == "hash.sh" ]]; then
		continue
	fi

	file_name=$(echo "${file_list[i]}" | cut -d '.' -f1)
	for hash in ${hash_list[@]}
	do
		hash_file_name="${file_name}.${hash}"
		printf "| %-*s |\n" ${max_len} "created ${hash_file_name}"
		echo `openssl ${hash} ${file_list[i]}` | cut -d ' ' -f2 > ${hash_file_name}
	done
done
echo "+----------------------------------+"
