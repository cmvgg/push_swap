#!/bin/bash

make re

# Contador de pruebas
total_tests=0
passed_tests=0

# Función para ejecutar pruebas y verificar resultados
run_test() {
    test_name=$1
    command=$2
    expected_max_moves=$3

    echo "Running $test_name..."
    total_tests=$((total_tests + 1))
    eval "$command" > exits/output_$test_name.txt 2>&1

    # Contar el número de movimientos
    num_moves=$(wc -l < exits/output_$test_name.txt)

    if [ "$num_moves" -le "$expected_max_moves" ]; then
        echo "$test_name: Passed ($num_moves moves)"
        passed_tests=$((passed_tests + 1))
    else
        echo "$test_name: Failed (Exceeded max moves: $num_moves moves)"
    fi
}

# 50 Pruebas Automatizadas con límites de movimientos

# Prueba 1: Entrada válida simple
run_test "simple_input" "./push_swap 2 1 3" 3

# Prueba 2: Entrada ya ordenada
run_test "already_sorted" "./push_swap 1 2 3" 1

# Prueba 3: Entrada reversa
run_test "reverse_order" "./push_swap 3 2 1" 3

# Prueba 4: Entrada con duplicados
run_test "with_duplicates" "./push_swap 3 3 1 2" 1

# Prueba 5: Argumentos inválidos
run_test "invalid_arguments" "./push_swap 1 a b 2" 1

# Prueba 6: Argumentos vacíos
run_test "empty_arguments" "./push_swap \"\"" 1

# Prueba 7: Argumentos con un solo número
run_test "single_number" "./push_swap 5" 1

# Prueba 8: Argumentos con dos números ya ordenados
run_test "two_sorted_numbers" "./push_swap 1 2" 1

# Prueba 9: Argumentos con dos números invertidos
run_test "two_reversed_numbers" "./push_swap 2 1" 1

# Prueba 10: Tres números ordenados
run_test "three_sorted_numbers" "./push_swap 1 2 3" 1

# Prueba 11: Tres números invertidos
run_test "three_reversed_numbers" "./push_swap 3 2 1" 3

# Prueba 12: Cuatro números ya ordenados
run_test "four_sorted_numbers" "./push_swap 1 2 3 4" 1

# Prueba 13: Cuatro números con el primero al final
run_test "four_numbers_rotated" "./push_swap 2 3 4 1" 4

# Prueba 14: Cuatro números con duplicados
run_test "four_numbers_with_duplicates" "./push_swap 2 2 4 3" 1

# Prueba 15: Muchos números aleatorios (10 números)
ARG=$(seq 1 10 | shuf | tr '\n' ' ')
run_test "random_10_numbers" "./push_swap $ARG" 40

# Prueba 16: Entrada con números muy grandes (3 números)
ARG="1000000 999999 999998"
run_test "large_numbers" "./push_swap $ARG" 3

# Prueba 17: Entrada con números negativos (si es compatible)
ARG="-1 -2 -3"
run_test "negative_numbers" "./push_swap $ARG" 3

# Prueba 18: Entrada con el mayor número posible
ARG="2147483647 -2147483648 1"
run_test "max_min_int" "./push_swap $ARG" 3

# Prueba 19: Entrada con todos los números iguales
ARG="5 5 5 5 5"
run_test "all_numbers_equal" "./push_swap $ARG" 1

# Prueba 20: Números con un solo dígito
ARG="1 2 3 4 5"
run_test "single_digit_numbers" "./push_swap $ARG" 12

# Prueba 21: Muy pocos números en orden inverso
ARG="5 4 3"
run_test "reverse_few_numbers" "./push_swap $ARG" 3

# Prueba 23: Entrada con 50 números únicos
ARG=$(seq 1 50 | shuf | tr '\n' ' ')
run_test "random_50_numbers" "./push_swap $ARG" 400

# Prueba 24: Entrada con 100 números únicos
ARG=$(seq 1 100 | shuf | tr '\n' ' ')
run_test "random_100_numbers" "./push_swap $ARG" 700

# Prueba 25: Entrada con más de 200 números
ARG=$(seq 1 200 | shuf | tr '\n' ' ')
run_test "random_200_numbers" "./push_swap $ARG" 2000

# Prueba 26: Prueba con caracteres no numéricos
run_test "characters_in_input" "./push_swap a b c" 1

# Prueba 27: Prueba con espacios en blanco antes o después de los números
ARG=" 1 2 3  "
run_test "input_with_spaces" "./push_swap $ARG" 1

# Prueba 28: Entrada con múltiples espacios entre los números
ARG="1    2   3"
run_test "input_with_multiple_spaces" "./push_swap $ARG" 1

# Prueba 29: Entrada con números decimales
ARG="1.5 2.5 3.5"
run_test "decimal_numbers" "./push_swap $ARG" 1

# Prueba 30: Entrada con números flotantes
ARG="1.5 2.0 3.0"
run_test "floating_numbers" "./push_swap $ARG" 1

# Prueba 31: Entrada con números negativos y positivos
ARG="-1 2 -3 4"
run_test "negative_and_positive" "./push_swap $ARG" 5

# Prueba 32: Entrada con valores de 0
ARG="0 0 0"
run_test "zero_values" "./push_swap $ARG" 1

# Prueba 33: Entrada de números negativos con espacio
ARG="-1  2 -3"
run_test "negative_numbers_space" "./push_swap $ARG" 5

# Prueba 34: Entrada con secuencia de números consecutivos
ARG="1 2 3 4 5 6 7 8 9 10"
run_test "consecutive_numbers" "./push_swap $ARG" 12

# Prueba 35: Entrada muy grande aleatoria
ARG=$(seq 1 1000000 | shuf | tr '\n' ' ')
run_test "large_random_input" "./push_swap $ARG" 5500

# Prueba 36: Entrada con valores positivos y negativos grandes
ARG="-1000 500 1000"
run_test "positive_negative_large" "./push_swap $ARG" 5

# Prueba 37: Entrada con 10 números con valores muy pequeños
ARG="-10 -5 -3 -1 1 2 3 5 10 50"
run_test "very_small_values" "./push_swap $ARG" 15

# Prueba 38: Entrada con una gran cantidad de entradas aleatorias
ARG=$(seq 1 500 | shuf | tr '\n' ' ')
run_test "random_large_input" "./push_swap $ARG" 5500

# Resumen
echo "Total tests: $total_tests"
echo "Passed tests: $passed_tests"
echo "Failed tests: $((total_tests - passed_tests))"
