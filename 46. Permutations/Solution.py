from typing import List
import ast

class Solution:
    def permute(self, nums: List[int]) -> List[List[int]]:
        def backtrack(start):
            if start == len(nums):
                permutations.append(nums[:])
            else:
                for i in range(start, len(nums)):
                    nums[start], nums[i] = nums[i], nums[start]
                    backtrack(start + 1)
                    nums[start], nums[i] = nums[i], nums[start]

        permutations = []
        backtrack(0)
        return permutations

if __name__ == "__main__":
    solution = Solution()
    nums_input = input("digite a lista de numeros no formato[1,2,3]: ")
    nums = ast.literal_eval(nums_input)
    result = solution.permute(nums)
    print("Input:", nums)
    print("Output:", result)
