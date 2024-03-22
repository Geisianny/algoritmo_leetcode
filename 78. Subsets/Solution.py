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

if __name__ == "__main__":
    solution = Solution()
    nums_input = input("Enter numbers in the format [1,2,3]: ")
    nums = ast.literal_eval(nums_input)
    result = solution.subsets(nums)
    print("Input:", nums)
    print("Output:", result)
