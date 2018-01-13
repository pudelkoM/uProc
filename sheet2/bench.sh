#!/bin/bash

runs_cache=$(echo "1024*1024*128" | bc)
printf "# memory	ns/access	total_accesses\n" > benchmark_cache.txt
for (( i = 3; i <= 22; i++ )); do
	taskset -c 1 ./cache_size -n $(echo "2^$i" | bc) --runs $runs_cache --quiet >> benchmark_cache.txt
	taskset -c 1 ./cache_size -n $(echo "2^$i + 2^($i-1)" | bc) --runs $runs_cache --quiet >> benchmark_cache.txt
done

echo never > /sys/kernel/mm/transparent_hugepage/enabled
runs_pages=$(echo "1024*1024*32" | bc)
printf "# pages	ns/access	total_accesses\n" > benchmark_page.txt
for (( i = 0; i <= 20; i++ )); do
	taskset -c 1 ./cache_size --page -n $(echo "2^$i" | bc) --runs $runs_pages --quiet >> benchmark_page.txt
	taskset -c 1 ./cache_size --page -n $(echo "2^$i + 2^($i-1)" | bc) --runs $runs_pages --quiet >> benchmark_page.txt
done

echo always > /sys/kernel/mm/transparent_hugepage/enabled
runs_pages=$(echo "1024*1024*32" | bc)
printf "# pages	ns/access	total_accesses\n" > benchmark_hugepage.txt
for (( i = 0; i <= 20; i++ )); do
	taskset -c 1 ./cache_size --page -n $(echo "2^$i" | bc) --runs $runs_pages --quiet >> benchmark_hugepage.txt
	taskset -c 1 ./cache_size --page -n $(echo "2^$i + 2^($i-1)" | bc) --runs $runs_pages --quiet >> benchmark_hugepage.txt
done
