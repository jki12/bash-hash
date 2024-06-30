# README.md

`hash.sh` 파일이 실행된 디렉토리 내의 모든 파일에 대해 해시 값을 계산하고, 각각의 파일에 대해 `{file}.{hash_type}` 형식으로 해시 값을 저장합니다.

md5, sha1 외 다른 해시값을 구하고 싶으면 19번째 라인에 해시 종류를 추가하면 됩니다.

`openssl openssl dgst -list`로 지원하는 해시 종류 확인이 가능합니다.

``` sh
...
file_list=(`ls`)
len=${#file_list[@]} # file list length.

hash_list=('md5' 'sha1') -> hash_list=('md5' 'sha1' 'sha256')
for i in `seq -w 0 $((len - 1))` # script 파일 제외, 범위를 [0, len - 1)로 하기 위해.
do
...
```


# Usage

### 현재 디렉토리에 있는 파일 리스트입니다.
<img width="1470" alt="Screenshot 2024-07-01 at 12 31 47 AM" src="https://github.com/jki12/bash-hash/assets/129145278/17d18e3d-51d6-428e-85a2-58907845e8f0">


### sh hash.sh 파일로 실행하면 터미널에 다음과 같이 출력 후 파일이 생성됩니다.
<img width="1470" alt="Screenshot 2024-07-01 at 12 28 58 AM" src="https://github.com/jki12/bash-hash/assets/129145278/b99d73e0-76ff-41ab-a7ce-278c07bf7b89">

<img width="1470" alt="Screenshot 2024-07-01 at 1 05 52 AM" src="https://github.com/jki12/bash-hash/assets/129145278/f546d107-dd40-452e-82c5-76e798e23bf4">
