from typing import Optional
import ast

# Define TreeNode class
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

class Solution:
    def invertTree(self, root: Optional['TreeNode']) -> Optional['TreeNode']:
        if not root: # Base Case
            return root
        # Call the left subtree
        left = self.invertTree(root.left)
        # Call the right subtree
        right = self.invertTree(root.right)
        # Swap the nodes
        root.left, root.right = right, left
        return root # Return the root

def tree_from_list(lst):
    if not lst:
        return None
    nodes = [None if val is None else TreeNode(val) for val in lst]
    n = len(nodes)
    for i, node in enumerate(nodes):
        if node:
            left_child_index = 2 * i + 1
            right_child_index = 2 * i + 2
            if left_child_index < n:
                node.left = nodes[left_child_index]
            if right_child_index < n:
                node.right = nodes[right_child_index]
    return nodes[0]

def list_from_tree(root):
    if not root:
        return []
    queue = [root]
    result = []
    while queue:
        node = queue.pop(0)
        if node:
            result.append(node.val)
            queue.append(node.left)
            queue.append(node.right)
        else:
            result.append(None)
    while result[-1] is None:
        result.pop()
    return result

def entradas(root_input):
    root_list = ast.literal_eval(root_input)
    root = tree_from_list(root_list)
    inverted_tree = solution.invertTree(root)
    inverted_list = list_from_tree(inverted_tree)
    print("Input: root =", root_list)
    print("Output:", inverted_list)

if __name__ == "__main__":
    solution = Solution()
    
    root_input = "[4,2,7,1,3,6,9]"
    entradas(root_input)
    print()

    root_input = "[2,1,3]"
    entradas(root_input)
    print()

    root_input = "[]"
    entradas(root_input)
    print()
   

