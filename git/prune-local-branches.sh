#!/bin/bash

# CAUTION: This script would remove all of branches where are not on remote.
# push first your working branch or backup with git archive command

# CAUTION: remote branch 에 존재하지 않는 local branch 를 삭제합니다.
# 백업이 필요하다면 git archive 를 활용하세요.

#!/bin/bash

for target in $(git branch | tee | grep -v "*")
do
    [[ $(git branch -r | grep $target | wc -l) -gt 0 ]] \
    && echo "Remote branch detected :"$target \
    || (git branch -D $target && echo "["$target"] branch is deleted")
done;
