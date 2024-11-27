#!/bin/bash

echo "Running Performance Tests..."

generate_unique_random_numbers() {
    count=$1
    min=$2
    max=$3

    if (( max - min + 1 < count )); then
        echo "Error: Rango insuficiente para generar números únicos" >&2
        exit 1
    fi

    seq $min $max | shuf | head -n $count | tr '\n' ' '
}

function measure_time() {
    ARG=$(generate_unique_random_numbers $1 1 $2)
    echo "Testing with $1 elements..."
    /usr/bin/time -f "Elapsed Time: %e seconds" ./push_swap $ARG > /dev/null 2>> exits/performance_output.txt
}

> exits/performance_output.txt

measure_time 10 100
measure_time 100 1000
measure_time 500 5000
measure_time 1000 10000
measure_time 2000 20000

echo "Performance tests completed. Results saved in performance_output.txt."
