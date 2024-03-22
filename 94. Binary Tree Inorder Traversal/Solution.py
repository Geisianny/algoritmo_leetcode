from typing import Optional, List
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

def create_tree(nodes: List[Optional[int]]) -> Optional[TreeNode]:
    if not nodes:
        return None
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

def main():
    # Solicitar ao usuário que insira os valores dos nós da árvore
    input_str = input("Input:")
    nodes = json.loads(input_str) if input_str else []
    root = create_tree(nodes)
    
    # Chamada e saída
    solution = Solution()
    print("Output:", solution.inorderTraversal(root))

if __name__ == "__main__":
    main()
