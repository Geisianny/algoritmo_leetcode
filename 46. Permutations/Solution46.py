from typing import List
import ast

class Solution46:
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

def entradas(nums):
    solution = Solution46()
    
    result = solution.permute(nums)
    print("Input:", nums)
    print("Output:", result)

if __name__ == "__main__":
    nums = [1,2,3]
    entradas(nums)
    print()

    nums = [0,1]
    entradas(nums)
    print()
    
    nums = [1]
    entradas(nums)
   
