from typing import List
import re

class Solution136:
    def singleNumber(self, nums: List[int]) -> int:
        result = 0
        for num in nums:
            result ^= num
        return result

def main(entrada):
    nums_str = re.findall(r'\d+', entrada)
    nums = [int(num) for num in nums_str]

    # Execução da função singleNumber
    solution = Solution()
    result = solution.singleNumber(nums)

    # Saída do resultado
    print("Output:", result)


entrada = "[2,2,1]"
print("Input: ",entrada)
main(entrada)
print()

entrada2 = "[4,1,2,1,2]"
print("Input: ",entrada2)
main(entrada2)
print()

entrada3 = "[1]"
print("Input: ",entrada3)
main(entrada3)