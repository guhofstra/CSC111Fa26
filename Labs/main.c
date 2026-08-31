#include <stdio.h>

// Forward declaration of the assembly sort functions
extern void bubble_sort(int *array, int length);
extern void cocktail_sort(int *array, int length);

void print_array(int *array, int length) {
    for(int i = 0; i < length; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");
}

int main() {
    // Match test array from assembly bubble_sort_complete.s
    int test_array[] = {64, 34, 25, 12, 22, 11, 90, 5, 77, 30};
    int length = sizeof(test_array) / sizeof(test_array[0]);

    printf("Array before sort:\n");
    print_array(test_array, length);

    // Call the assembly bubble sort function
    bubble_sort(test_array, length);
    //cocktail_sort(test_array, length);

    printf("Array after sort:\n");
    print_array(test_array, length);

    return 0;
}
