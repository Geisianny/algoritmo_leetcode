import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;

    TreeNode() {}

    TreeNode(int val) {
        this.val = val;
    }

    TreeNode(int val, TreeNode left, TreeNode right) {
        this.val = val;
        this.left = left;
        this.right = right;
    }
}

class Solution78 {
    public static TreeNode createTree(List<Object> nodes) {
        if (nodes == null || nodes.isEmpty()) {
            return null;
        }

        TreeNode root = new TreeNode((Integer) nodes.get(0));
        List<TreeNode> queue = new ArrayList<>();
        queue.add(root);
        int i = 1;

        while (!queue.isEmpty()) {
            TreeNode node = queue.remove(0);
            if (node != null) {
                if (i < nodes.size() && nodes.get(i) != null) {
                    node.left = new TreeNode((Integer) nodes.get(i));
                    queue.add(node.left);
                }
                i++;
                if (i < nodes.size() && nodes.get(i) != null) {
                    node.right = new TreeNode((Integer) nodes.get(i));
                    queue.add(node.right);
                }
                i++;
            }
        }
        return root;
    }

    public static void entrada(List<Object> nodes) {
        TreeNode root = createTree(nodes);
        Solution78 solution = new Solution78();
        System.out.println("Input: root = " + nodes);
        System.out.println("Output: " + solution.inorderTraversal(root));
    }

    public static void main(String[] args) {
        List<Object> nodes = new ArrayList<>();
        nodes.add(1);
        nodes.add(null);
        nodes.add(2);
        nodes.add(3);
        entrada(nodes);
        System.out.println();

        nodes.clear();
        entrada(nodes);
        System.out.println();

        nodes.add(1);
        entrada(nodes);
    }

    public List<Integer> inorderTraversal(TreeNode root) {
        List<Integer> res = new ArrayList<>();
        Stack<TreeNode> st = new Stack<>();

        while (root != null || !st.isEmpty()) {
            while (root != null) {
                st.push(root);
                root = root.left;
            }

            root = st.pop();
            res.add(root.val);

            root = root.right;
        }

        return res;
    }
}
