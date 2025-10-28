#!/bin/env bash

git filter-branch --env-filter '

if [ "$GIT_COMMIT" = "1b5e7b9c41abe08559cbdf1ff53bc1c5aaf9e76b" ]; then
    export GIT_AUTHOR_DATE="2021-01-11T23:10:13"
    export GIT_COMMITTER_DATE="2021-01-11T23:10:13"
fi

if [ "$GIT_COMMIT" = "b47b95ffa637792bcf94be0501aaef31dc5c97a7" ]; then
    export GIT_AUTHOR_DATE="2021-01-12T15:41:45"
    export GIT_COMMITTER_DATE="2021-01-12T15:41:45"
fi

if [ "$GIT_COMMIT" = "8c1a817a54f8f48554b268c4b4e29d42d16f4f92" ]; then
    export GIT_AUTHOR_DATE="2021-01-13T11:41:02"
    export GIT_COMMITTER_DATE="2021-01-13T23:41:02"
fi

' -f -- --all

