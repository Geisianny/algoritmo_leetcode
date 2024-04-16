import java.util.ArrayList;
import java.util.List;

public class Solution78 {
    public List<List<Integer>> subsets(int[] nums) {
        List<List<Integer>> lst = new ArrayList<>();
        lst.add(new ArrayList<>());
        for (int i = 1; i <= nums.length; i++) {
            List<List<Integer>> ans = combinations(nums, i);
            for (List<Integer> comb : ans) {
                lst.add(new ArrayList<>(comb));
            }
        }
        return lst;
    }

    private List<List<Integer>> combinations(int[] nums, int k) {
        List<List<Integer>> result = new ArrayList<>();
        backtrack(result, new ArrayList<>(), nums, k, 0);
        return result;
    }

    private void backtrack(List<List<Integer>> result, List<Integer> tempList, int[] nums, int k, int start) {
        if (tempList.size() == k) {
            result.add(new ArrayList<>(tempList));
        } else {
            for (int i = start; i < nums.length; i++) {
                tempList.add(nums[i]);
                backtrack(result, tempList, nums, k, i + 1);
                tempList.remove(tempList.size() - 1);
            }
        }
    }

    public static void entrada(int[] nums) {
        Solution78 solution = new Solution78();
        List<List<Integer>> result = solution.subsets(nums);
        System.out.println("Input: " + java.util.Arrays.toString(nums));
        System.out.println("Output: " + result);
    }

    public static void main(String[] args) {
        int[] nums = {1, 2, 3};
        entrada(nums);
        System.out.println();

        int[] nums2 = {0};
        entrada(nums2);
    }
}
