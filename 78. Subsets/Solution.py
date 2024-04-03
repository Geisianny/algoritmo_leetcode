from typing import List
import ast
import itertools

class Solution:
    def subsets(self, nums: List[int]) -> List[List[int]]:
        lst = [[]]
        for i in range(1, len(nums) + 1):
            ans = list(itertools.combinations(nums, i))
            lst.extend([list(comb) for comb in ans])
        return lst

def entrada(nums):
    solution = Solution()
    result = solution.subsets(nums)
    print("Input:", nums)
    print("Output:", result)


if __name__ == "__main__":
    nums = [1,2,3]
    entrada(nums)
    print()
    
    nums = [0]
    entrada(nums)