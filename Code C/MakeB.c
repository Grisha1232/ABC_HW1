int MakeB(int A[], int N, int *B) {
    int j;
    int counter = 0;
    for (j = 0; j < N; j++) {
        if (A[j] != A[0] && A[j] != A[N - 1]) {
            B[counter] = A[j];
            counter++;
        }
    }
    return counter;
}
