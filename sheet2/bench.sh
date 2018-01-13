#!/bin/bash

runs=$(echo "1024*1024*128" | bc)
printf "# memory	ns/access	total_accesses\n" > benchmark.txt
for (( i = 3; i <= 22; i++ )); do
	taskset -c 1 ./cache_size -n $(echo "2^$i" | bc) --runs $runs --quiet >> benchmark.txt
	taskset -c 1 ./cache_size -n $(echo "2^$i + 2^($i-1)" | bc) --runs $runs --quiet >> benchmark.txt
done
