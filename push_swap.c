#include <stdio.h>
#include <stdlib.h>

// Definición de las operaciones
#define SA "sa\n"
#define SB "sb\n"
#define SS "ss\n"
#define PA "pa\n"
#define PB "pb\n"
#define RA "ra\n"
#define RB "rb\n"
#define RR "rr\n"
#define RRA "rra\n"
#define RRB "rrb\n"
#define RRR "rrr\n"

// Estructura para representar un elemento en el stack
typedef struct {
    int value;
    int sorted;  // Variable para verificar si está en su posición ordenada
} Element;

// Función para intercambiar dos elementos en el stack
void swap(Element *a, Element *b) {
    Element temp = *a;
    *a = *b;
    *b = temp;
}

// Función para verificar si el stack está ordenado
int is_sorted(const Element *arr, int size) {
    int i = 0;
    while (i < size - 1) {
        if (arr[i].value > arr[i + 1].value) {
            return 0;  // No está ordenado
        }
        i++;
    }
    return 1;  // Está ordenado
}

// Función para convertir una cadena de caracteres a un entero
int ft_atoi(const char *str) {
    int result = 0;
    int sign = 1;

    // Manejo de espacios en blanco iniciales
    while (*str == ' ' || (*str >= '\t' && *str <= '\r')) {
        str++;
    }

    // Manejo del signo
    if (*str == '-') {
        sign = -1;
        str++;
    } else if (*str == '+') {
        str++;
    }

    // Convertir caracteres a enteros
    while (*str >= '0' && *str <= '9') {
        result = result * 10 + (*str - '0');
        str++;
    }

    // Aplicar el signo
    return result * sign;
}

// Función para aplicar el algoritmo híbrido
int hybridSort(Element *arr, int low, int high) {
    int movimientos = 0;
    if (low < high) {
        if (high - low + 1 <= 5) {
            // Utiliza bubblesort para tamaños pequeños
            // Implementación de bubblesort
            int i = low;
            while (i < high) {
                int j = low;
                while (j < high) {
                    if (arr[j].value > arr[j + 1].value) {
                        // Intercambia los elementos
                        swap(&arr[j], &arr[j + 1]);
                        movimientos++;
                    }
                    j++;
                }
                i++;
            }
        } else {
            // Utiliza quicksort para tamaños grandes
            int pivot = arr[(low + high) / 2].value;
            int i = low;
            int j = high;
            while (i <= j) {
                while (arr[i].value < pivot) {
                    i++;
                }
                while (arr[j].value > pivot) {
                    j--;
                }
                if (i <= j) {
                    swap(&arr[i], &arr[j]);
                    movimientos++;
                    i++;
                    j--;
                }
            }
            movimientos += hybridSort(arr, low, j);
            movimientos += hybridSort(arr, i, high);
        }
    }
    return movimientos;
}

// Función principal
int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Uso: %s <lista de enteros>\n", argv[0]);
        return 1;
    }

    int size = argc - 1;
    Element *stack_a = malloc(size * sizeof(Element));

    if (!stack_a) {
        perror("Error de memoria");
        return 1;
    }

    // Inicializa el stack a con los valores proporcionados
    int i = 0;
    while (i < size) {
        stack_a[i].value = ft_atoi(argv[i + 1]);
        stack_a[i].sorted = 0;  // Inicialmente, ningún elemento está en su posición ordenada
        i++;
    }

    // Llama a la función hybridSort para ordenar el stack
    int totalMovimientos = hybridSort(stack_a, 0, size - 1);

    // Verifica si el stack está ordenado después de la operación
    if (!is_sorted(stack_a, size)) {
        fprintf(stderr, "Error: El stack no está ordenado correctamente después de las operaciones.\n");
        free(stack_a);
        return 1;
    }

    // Mostrar el stack ordenado y el número total de movimientos
    printf("Stack ordenado: ");
    i = 0;
    while (i < size) {
        printf("%d ", stack_a[i].value);
        i++;
    }
    printf("\nNúmero total de movimientos: %d\n", totalMovimientos);

    // Liberar memoria
    free(stack_a);

    return 0;
}
