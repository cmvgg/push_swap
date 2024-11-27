#!/bin/bash

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
# Test 1: Entrada vacía
echo "Running test 1..."
./push_swap > exits/output1.txt
diff exits/output1.txt test_archives/empty_answer.txt && echo "Test 1 Passed" || echo "Test 1 Failed"

# Test 2: Archivo vacío
echo "Running test 2..."
./push_swap "" > exits/output2.txt
diff exits/output2.txt test_archives/empty_answer.txt && echo "Test 2 Passed" || echo "Test 2 Failed"

# Test 3: Números no válidos
echo "Running test 3..."
./push_swap abc 123a > exits/output3.txt
diff exits/output3.txt <(echo "Error") && echo "Test 3 Passed" || echo "Test 3 Failed"

# Test 4: Números válidos
echo "Running test 4..."
./push_swap 1 3 2 > exits/moves_output4.txt

sleep 1

 < exits/moves_output4.txt wc -l > exits/output4.txt

moves=$(cat exits/output4.txt)

if [ $moves -lt 3 ]; then
    echo "Test 4 Passed: $moves moves to 3 elements"
else
    echo "Test 4 Failed: $moves moves to 3 elements"
fi

# Test 5: 100 elementos (números únicos)
echo "Running test 5..."

ARG=$(generate_unique_random_numbers 100 1 1000000)

./push_swap $ARG > exits/moves_output5.txt 

sleep 1

 < exits/moves_output5.txt wc -l > exits/output5.txt

moves=$(cat exits/output5.txt)

if [ $moves -lt 701 ]; then
    echo "Test 5 Passed: $moves of 700 moves"
else
    echo "Test 5 Failed: $moves of 700 moves"
fi

# Test 6: 500 elementos (números únicos)
echo "Running test 6..."

ARG=$(generate_unique_random_numbers 500 1 1000000)

./push_swap $ARG > exits/moves_output6.txt 

sleep 1

 < exits/moves_output6.txt wc -l > exits/output6.txt

moves=$(cat exits/output6.txt)

if [ $moves -lt 5501 ]; then
    echo "Test 6 Passed: $moves of 5500 moves"
else
    echo "Test 6 Failed: $moves of 5500 moves"
fi

# Test 7: Un solo número
echo "Running test 7..."
./push_swap 5 > exits/output7.txt
diff exits/output7.txt test_archives/empty_answer.txt && echo "Test 7 Passed" || echo "Test 6 Failed"

# Test 8: gran numero de elementos (números únicos)
echo "Running test 8 (this test is very long)..."
ARG=$(generate_unique_random_numbers 4000 1 1000000)
./push_swap $ARG > exits/moves_output8.txt 

sleep 1

 < exits/moves_output8.txt wc -l > exits/output8.txt

moves=$(cat exits/output8.txt)

if [ $moves -gt 1 ]; then
    echo "Test 8 Passed"
	echo "$moves moves for 4000 elements"
else
    echo "Test 8 Failed"
fi

# Test 9: Prueba con comillas dobles
echo "Running test 9..."

./push_swap "42 39 17" > exits/output9.txt

if [ $? -eq 0 ]; then
    echo "Test 9 (Double Quotes) Passed"
else
    echo "Test 9 (Double Quotes) Failed"
fi

# Test 10: Prueba con comillas simples
echo "Running test 10..."

./push_swap '42 39 17' > exits/output10.txt

if [ $? -eq 0 ]; then
    echo "Test 10 (Single Quotes) Passed"
else
    echo "Test 10 (Single Quotes) Failed"
fi

# Test 11: Prueba con asterisco
echo "Running test 11..."

ARG="42 36 * 17"
./push_swap $ARG > exits/output11.txt

diff exits/output11.txt <(echo "Error") && echo "Test 11 Passed" || echo "Test 11 Failed"

# Test 12: Prueba con ampersand
ARG="42 36 & 17"
./push_swap $ARG > exits/output12.txt

diff exits/output12.txt <(echo "Error") && echo "Test 12 Passed" || echo "Test 12 Failed"

# Test 13: Prueba con pipe
ARG="42 36 | 17"
./push_swap $ARG > exits/output13.txt

diff exits/output13.txt <(echo "Error") && echo "Test 13 Passed" || echo "Test 13 Failed"