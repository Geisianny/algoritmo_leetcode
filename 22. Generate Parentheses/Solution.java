import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Solution {

    public List<String> generateParenthesis(int n) {
        List<String> result = new ArrayList<>();
        dfs(0, 0, n, "", result);
        return result;
    }

    private void dfs(int left, int right, int n, String s, List<String> result) {
        if (s.length() == n * 2) {
            result.add(s);
            return;
        }

        if (left < n) {
            dfs(left + 1, right, n, s + "(", result);
        }

        if (right < left) {
            dfs(left, right + 1, n, s + ")", result);
        }
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = 3;
        System.out.println("Input: " + n);

        Solution solution = new Solution();
        List<String> output = solution.generateParenthesis(n);

        System.out.println("Output: " + output);

        n = 1;
        output = solution.generateParenthesis(n);
        System.out.println("Output: " + output);
    }
}
