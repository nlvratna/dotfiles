#!/usr/bin/env bash

selected=$(docker ps -a --format "{{.Names}}\t{{.Status}}" | fzf | awk '{print $1}')

docker start "$selected"
