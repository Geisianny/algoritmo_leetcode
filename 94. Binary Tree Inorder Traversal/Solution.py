from typing import Optional, List, Union
import json

class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right
        
class Solution:
    def inorderTraversal(self, root: Optional[TreeNode]) -> List[int]:
        st = []
        res = []

        while root or st:
            while root:
                st.append(root)
                root = root.left
            
            root = st.pop()
            res.append(root.val)

            root = root.right
        
        return res  

def create_tree(nodes: List[Union[int, None]]) -> Optional[TreeNode]:
    if not nodes:
        return None
    for i in range(len(nodes)):
        if nodes[i] == "null":
            nodes[i] = None
    root = TreeNode(nodes[0])
    queue = [root]
    i = 1
    while queue:
        node = queue.pop(0)
        if node:
            if i < len(nodes) and nodes[i] is not None:
                node.left = TreeNode(nodes[i])
                queue.append(node.left)
            i += 1
            if i < len(nodes) and nodes[i] is not None:
                node.right = TreeNode(nodes[i])
                queue.append(node.right)
            i += 1
    return root

def entrada(nodes): 
    root = create_tree(nodes)
    solution = Solution()
    print("Input: root = ", nodes)
    print("Output:", solution.inorderTraversal(root))

def main():
    nodes = [1, "null", 2, 3] 
    entrada(nodes)
    print()

    nodes = [] 
    entrada(nodes)
    print()

    nodes = [1] 
    entrada(nodes)

   
if __name__ == "__main__":
    main()
