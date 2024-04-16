import java.util.Queue;
import java.util.LinkedList;

public class Solution104 {

    public static void main(String[] args) {

        String input = "[3,9,20,null,null,15,7]";
        System.out.println("Input: " + input);
        entradas(input);

        input = "[1,null,2]";
        System.out.println("\nInput: " + input);
        entradas(input);

    }

    public static void entradas(String input) {
        Solution104 solution = new Solution104();
        TreeNode root = createTree(input);

        int maxDepth = solution.maxDepth(root);

        System.out.println("Output: " + maxDepth);
    }

    public int maxDepth(TreeNode root) {
        if (root == null) {
            return 0;
        }
        return 1 + Math.max(maxDepth(root.left), maxDepth(root.right));
    }

    public static class TreeNode {
        int val;
        TreeNode left;
        TreeNode right;

        TreeNode() {
        }

        TreeNode(int val) {
            this.val = val;
        }

        TreeNode(int val, TreeNode left, TreeNode right) {
            this.val = val;
            this.left = left;
            this.right = right;
        }
    }

    public static TreeNode createTree(String input) {
        input = input.substring(1, input.length() - 1); // Remove square brackets
        String[] nodes = input.split(",");
        if (nodes[0].equals("null")) {
            return null;
        }
        TreeNode root = new TreeNode(Integer.parseInt(nodes[0]));
        Queue<TreeNode> queue = new LinkedList<>();
        queue.add(root);
        int index = 1;
        while (!queue.isEmpty() && index < nodes.length) {
            TreeNode current = queue.poll();
            if (!nodes[index].equals("null")) {
                current.left = new TreeNode(Integer.parseInt(nodes[index]));
                queue.add(current.left);
            }
            index++;
            if (index < nodes.length && !nodes[index].equals("null")) {
                current.right = new TreeNode(Integer.parseInt(nodes[index]));
                queue.add(current.right);
            }
            index++;
        }
        return root;
    }

}
