#!/bin/bash

make re

echo "Running Robustness Tests..."

# Prueba 1: Entrada excesiva
echo "Testing with excessive input..."
ARG=$(yes "1" | head -n 1000000 | tr '\n' ' ')
./push_swap $ARG > exits/robustness1.txt 2>&1
if [ $? -ne 0 ]; then
    echo "Excessive input test Passed"
else
    echo "Excessive input test Failed (No Segfault)"
fi

# Prueba 2: Argumentos extremadamente largos
echo "Testing with overly long arguments..."
LONG_ARG=$(perl -e 'print "1" x 1000000')
./push_swap $LONG_ARG > exits/robustness2.txt 2>&1
if [ $? -ne 0 ]; then
    echo "Overly long argument test Passed"
else
    echo "Overly long argument test Failed (No Segfault)"
fi

# Prueba 3: Mezcla de caracteres especiales y espacios
echo "Testing with special characters and spaces..."
./push_swap "!@#$%^&*()   42" > exits/robustness3.txt 2>&1
if [ $? -ne 0 ]; then
    echo "Special characters test Passed"
else
    echo "Special characters test Failed (No Segfault)"
fi

# Prueba 4: Cadena nula (NULL)
echo "Testing with null string as argument..."
./push_swap NULL > exits/robustness4.txt 2>&1
if [ $? -ne 0 ]; then
    echo "Null string test Passed"
else
    echo "Null string test Failed (No Segfault)"
fi

# Prueba 5: Números duplicados en grandes cantidades
echo "Testing with large duplicates..."
ARG=$(yes "42" | head -n 100000 | tr '\n' ' ')
./push_swap $ARG > exits/robustness5.txt 2>&1
if [ $? -ne 0 ]; then
    echo "Large duplicates test Passed"
else
    echo "Large duplicates test Failed (No Segfault)"
fi

# Prueba 6: Argumentos vacíos intercalados con valores válidos
echo "Testing with interleaved empty and valid arguments..."
./push_swap "84" "" "42" "" > exits/robustness6.txt 2>&1
if [ $? -ne 0 ]; then
    echo "Interleaved empty arguments test Passed"
else
    echo "Interleaved empty arguments test Failed (No Segfault)"
fi

# Prueba 7: Combinaciones extremas de límites y caracteres
echo "Testing with edge values and mixed characters..."
./push_swap "2147483647 -2147483648 a b c d" > exits/robustness7.txt 2>&1
if [ $? -ne 0 ]; then
    echo "Edge values and characters test Passed"
else
    echo "Edge values and characters test Failed (No Segfault)"
fi

echo "Robustness tests for segmentation faults completed."
