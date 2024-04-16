from typing import List

class Solution48:
    def rotate(self, matrix: List[List[int]]) -> None:
        """
        Do not return anything, modify matrix in-place instead.
        """
        def transpose(matrix):
            for i in range(len(matrix)):
                for j in range(i, len(matrix[0])):
                    matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]

        def reverse_rows(matrix):
            for r in range(len(matrix)):
                left, right = 0, len(matrix[0]) - 1
                while left < right:
                    matrix[r][left], matrix[r][right] = matrix[r][right], matrix[r][left]
                    left += 1
                    right -= 1

        transpose(matrix)
        reverse_rows(matrix)

# Teste de uso e impressão do resultado no formato desejado
matrix = [[1, 2, 3],
          [4, 5, 6],
          [7, 8, 9]]

matrix2 = [[5,1,9,11],
          [2,4,8,10],
          [13,3,6,7],
          [15,14,12,16]]

solution = Solution48()
solution.rotate(matrix)
solution.rotate(matrix2)

output = "["
for row in matrix:
    output += str(row) + ","
output = output[:-1] + "]"  # Removendo a última vírgula e adicionando o colchete de fechamento
print("Output:",output)
print()

output = "["
for row in matrix2:
    output += str(row) + ","
output = output[:-1] + "]"  # Removendo a última vírgula e adicionando o colchete de fechamento
print("Output:",output)
