class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

class Solution94:
    @staticmethod
    def create_tree(nodes):
        if nodes is None or len(nodes) == 0:
            return None

        root = TreeNode(nodes[0])
        queue = [root]
        i = 1

        while queue:
            node = queue.pop(0)
            if node:
                if i < len(nodes) and nodes[i] != "null":
                    node.left = TreeNode(nodes[i])
                    queue.append(node.left)
                i += 1
                if i < len(nodes) and nodes[i] != "null":
                    node.right = TreeNode(nodes[i])
                    queue.append(node.right)
                i += 1
        return root

    @staticmethod
    def entrada(nodes):
        root = Solution94.create_tree(nodes)
        solution = Solution94()
        print("Input: root =", nodes)
        print("Output:", solution.inorder_traversal(root))

    def inorder_traversal(self, root):
        res = []
        st = []

        while root or st:
            while root:
                st.append(root)
                root = root.left

            root = st.pop()
            res.append(root.val)

            root = root.right

        return res

if __name__ == "__main__":
    nodes = [1, "null", 2, 3]
    Solution94.entrada(nodes)
    print()

    nodes.clear()
    Solution94.entrada(nodes)
    print()

    nodes.append(1)
    Solution94.entrada(nodes)
