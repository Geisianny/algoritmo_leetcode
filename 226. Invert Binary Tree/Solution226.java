import java.util.*;

public class Solution226 {
    public int singleNumber(int[] nums) {
        int result = 0;
        for (int num : nums) {
            result ^= num;
        }
        return result;
    }

    public static void main(String[] args) {
        int[] nums1 = {2, 2, 1};
        printResult(nums1);

        int[] nums2 = {4, 1, 2, 1, 2};
        printResult(nums2);

        int[] nums3 = {1};
        printResult(nums3);
    }

    private static void printResult(int[] nums) {
        Solution226  solution = new Solution226 ();
        System.out.println("Input: " + Arrays.toString(nums));
        int result = solution.singleNumber(nums);
        System.out.println("Output: " + result + "\n");
    }
}
