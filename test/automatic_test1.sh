#!/bin/bash

make re

mkdir -p exits
#TEST 1
./push_swap a > exits/output_test1.txt

diff exits/output_test1.txt <(echo "Error")

if [ $? -eq 0 ]; then
    echo "Passed"
else
    echo "Failed"
fi

sleep 1

#TEST 2
touch exits/output_test2.txt

./push_swap > exits/output_test2.txt

diff exits/output_test2.txt test_archives/empty_answer.txt

if [ $? -eq 0 ]; then
    echo "Passed"
else
    echo "Failed"
fi

sleep 1

#TEST 3
./push_swap 1 a > exits/output_test3.txt

diff exits/output_test3.txt <(echo "Error")

if [ $? -eq 0 ]; then
    echo "Passed"
else
    echo "Failed"
fi

sleep 1

#TEST 4
./push_swap 1 1 > exits/output_test4.txt

diff exits/output_test4.txt <(echo "Error")

if [ $? -eq 0 ]; then
    echo "Passed"
else
    echo "Failed"
fi

sleep 1

#TEST 5
./push_swap 1.1 2 > exits/output_test5.txt

diff exits/output_test5.txt <(echo "Error")

if [ $? -eq 0 ]; then
    echo "Passed"
else
    echo "Failed"
fi

sleep 1

#TEST 6
./push_swap 2 1 > exits/output_test6.txt

diff exits/output_test6.txt <(echo "sa")

if [ $? -eq 0 ]; then
    echo "Passed"
else
    echo "Failed"
fi

sleep 1

#TEST 7
./push_swap 3 2 1 > exits/output_test7.txt

diff exits/output_test7.txt test_archives/ok2_answer.txt

if [ $? -eq 0 ]; then
    echo "Passed"
else
    echo "Failed"
fi

make clean
