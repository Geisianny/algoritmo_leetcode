from typing import List

class Solution:
    def generateParenthesis(self, n: int) -> List[str]:
        def dfs(left, right, s):
            if len(s) == n * 2:
                res.append(s)
                return 

            if left < n:
                dfs(left + 1, right, s + '(')

            if right < left:
                dfs(left, right + 1, s + ')')

        res = []
        dfs(0, 0, '')
        return res

# Solicitar entrada do usuário
n = int(input("Input: 3"))

# Criar uma instância da classe Solution
solution = Solution()

# Obter a lista de strings de parênteses
output = solution.generateParenthesis(n)

# Exibir a saída formatada
print("Output:", output)
