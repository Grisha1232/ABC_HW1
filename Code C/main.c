#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define max_size 50

extern int MakeB(int A[], int N, int *B);

int main(int argc, char *argv[]) {
    int A[max_size];
    int B[max_size];
    int An = 0;
    int Bn = 0;
    int i;
    printf("Enter the number of elements (0 < N <= %d): ", max_size);
    scanf("%d", &An);
    for (i = 0; i < An; i++) {
        printf("A[%d] = ", i);
        scanf("%d", &A[i]);
    }
    Bn = MakeB(A, An, B);
    for (i = 0; i < Bn; i++) {
        printf("%d ", B[i]);
    }
    return 0;
}
