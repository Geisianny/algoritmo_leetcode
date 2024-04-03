import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

class Solution {
    public int singleNumber(int[] nums) {
        int result = 0;
        for (int num : nums) {
            result ^= num;
        }
        return result;
    }

    public static void main(String[] args) {
        String entrada = "[2,2,1]";
        System.out.println("Input: " + entrada);
        mainMethod(entrada);
        System.out.println();

        String entrada2 = "[4,1,2,1,2]";
        System.out.println("Input: " + entrada2);
        mainMethod(entrada2);
        System.out.println();

        String entrada3 = "[1]";
        System.out.println("Input: " + entrada3);
        mainMethod(entrada3);
    }

    public static void mainMethod(String entrada) {
        List<Integer> nums = extractNumbers(entrada);

        // Execução da função singleNumber
        Solution solution = new Solution();
        int result = solution.singleNumber(nums.stream().mapToInt(Integer::intValue).toArray());

        // Saída do resultado
        System.out.println("Output: " + result);
    }

    public static List<Integer> extractNumbers(String entrada) {
        List<Integer> nums = new ArrayList<>();
        Pattern pattern = Pattern.compile("\\d+");
        Matcher matcher = pattern.matcher(entrada);
        while (matcher.find()) {
            nums.add(Integer.parseInt(matcher.group()));
        }
        return nums;
    }
}
