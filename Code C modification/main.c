#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define max_size 100

extern int MakeB(int A[], int N, int* B);

int main(int argc, char *argv[]) {
    int A[max_size];
    int B[max_size];
    int An = 0;
    int Bn = 0;
    int i;
    FILE *input, *output;
    if (argc == 2) { // Enter in file
        input = fopen("tests/input.txt", "r");
        fscanf(input, "%d", &An);
        for (i = 0; i < An; i++) {
            fscanf(input, "%d", &A[i]);
        }
        fclose(input);
        output = fopen("tests/output.txt", "w");
        Bn = MakeB(A, An, B);
        for (i = 0; i < Bn; i++) {
            fprintf(output, "%d ", B[i]);
        }
        fclose(output);
        return 0;
    }

    printf("Enter the number of elements (0 < N <= %d): ", max_size);
    scanf("%d", &An);
    char isRandom;
    printf("Random input? (y/n): ");
    scanf(" %c", &isRandom);
    if (isRandom == 'y') {
        struct timespec sec;
        clock_gettime(CLOCK_REALTIME, &sec);
        srand(sec.tv_nsec);
        for (i = 0; i < An; i++) {
            A[i] = rand() % 1000;
            printf("A[%d] = %d\n", i, A[i]);
        }
    } else {
        for (i = 0; i < An; i++) {
            printf("A[%d] = ", i);
            scanf("%d", &A[i]);
        }
    }
    time_t start_time =  clock();
    for (i = 0; i < 5000000; i++) {
    	Bn = MakeB(A, An, B);
    }
    time_t end_time = clock();
    printf("\n%f\n", difftime(end_time, start_time));
    for (i = 0; i < Bn; i++) {
        printf("%d ", B[i]);
    }
    return 0;
}
