#include <stdio.h>
#include <stddef.h>  // Para NULL
#include <stdlib.h>  // Para malloc

int** generate(int numRows, int* returnSize, int** returnColumnSizes) {
    int** ret;
    *returnSize = numRows;
    *returnColumnSizes = (int*)malloc(sizeof(int) * numRows);
    ret = (int**)malloc(sizeof(int*) * numRows);
    for (int i = 0; i < numRows; i++) {
        (*returnColumnSizes)[i] = i + 1;
        ret[i] = (int*)malloc(sizeof(int) * (i + 1));
        for (int j = 0; j <= i; j++) {
            if (j == 0 || j == i)
                ret[i][j] = 1;
            else
                ret[i][j] = ret[i - 1][j - 1] + ret[i - 1][j];
        }
    }
    return ret;
}

void freeResult(int** result, int numRows) {
    for (int i = 0; i < numRows; i++) {
        free(result[i]);
    }
    free(result);
}

void entradas(int numRows){
    int returnSize;
    int* returnColumnSizes;
    int** result;
    
    printf("Input: %d\n", numRows);
    result = generate(numRows, &returnSize, &returnColumnSizes);
    
    // Output do resultado
    printf("Output: [");
    for (int i = 0; i < numRows; i++) {
        printf("[");
        for (int j = 0; j < returnColumnSizes[i]; j++) {
            printf("%d", result[i][j]);
            if (j != returnColumnSizes[i] - 1)
                printf(",");
        }
        printf("]");
        if (i != numRows - 1)
            printf(",");
    }
    printf("]\n");

    // Libera memória alocada
    freeResult(result, numRows);
    free(returnColumnSizes);
}

int main() {
    int numRows;
    
    numRows = 5;
    entradas(numRows);
    printf("\n");
    
    numRows = 1;
    entradas(numRows);

    return 0;
}
