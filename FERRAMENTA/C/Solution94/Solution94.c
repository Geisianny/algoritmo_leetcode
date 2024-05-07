#include <stdio.h>
#include <stdlib.h>

struct TreeNode {
    int val;
    struct TreeNode *left;
    struct TreeNode *right;
};

struct TreeNode* createTree(int* nodes, int size) {
    if (nodes == NULL || size == 0) {
        return NULL;
    }

    struct TreeNode* root = (struct TreeNode*)malloc(sizeof(struct TreeNode));
    root->val = nodes[0];
    root->left = NULL;
    root->right = NULL;

    struct TreeNode** queue = (struct TreeNode**)malloc(size * sizeof(struct TreeNode*));
    int i = 1;
    int front = 0;
    int rear = 0;

    queue[rear++] = root;

    while (front < rear) {
        struct TreeNode* node = queue[front++];
        if (node != NULL) {
            if (i < size && nodes[i] != 0) {
                node->left = (struct TreeNode*)malloc(sizeof(struct TreeNode));
                node->left->val = nodes[i];
                node->left->left = NULL;
                node->left->right = NULL;
                queue[rear++] = node->left;
            }
            i++;
            if (i < size && nodes[i] != 0) {
                node->right = (struct TreeNode*)malloc(sizeof(struct TreeNode));
                node->right->val = nodes[i];
                node->right->left = NULL;
                node->right->right = NULL;
                queue[rear++] = node->right;
            }
            i++;
        }
    }

    free(queue);
    return root;
}

void inorderTraversal(struct TreeNode* root) {
    if (root == NULL) {
        return;
    }

    struct TreeNode** stack = (struct TreeNode**)malloc(1000 * sizeof(struct TreeNode*));
    int top = -1;

    printf("[");
    while (root != NULL || top != -1) {
        while (root != NULL) {
            stack[++top] = root;
            root = root->left;
        }

        root = stack[top--];
        printf("%d", root->val);

        if (root->right != NULL || top != -1) {
            printf(",");
        }

        root = root->right;
    }
    printf("]");
    free(stack);
}

int main() {
    int nodes1[] = {1, 0, 2, 3}; // Alterado de NULL para 0
    int size1 = sizeof(nodes1) / sizeof(nodes1[0]);

    struct TreeNode* root1 = createTree(nodes1, size1);

    printf("Input: root = [");
    for (int i = 0; i < size1; ++i) {
        if (i != size1 - 1) {
            if (nodes1[i] == 0) {
                printf("null,");
            } else {
                printf("%d,", nodes1[i]);
            }
        } else {
            if (nodes1[i] == 0) {
                printf("null");
            } else {
                printf("%d", nodes1[i]);
            }
        }
    }
    printf("]\n");

    printf("Output: ");
    inorderTraversal(root1);
    printf("\n");

    int nodes2[] = {}; // Lista de nós vazia
    int size2 = sizeof(nodes2) / sizeof(nodes2[0]);

    printf("Input: root = []\n");
    printf("Output: []\n");

    int nodes3[] = {1}; // Apenas um nó
    int size3 = sizeof(nodes3) / sizeof(nodes3[0]);

    struct TreeNode* root3 = createTree(nodes3, size3);

    printf("Input: root = [");
    for (int i = 0; i < size3; ++i) {
        if (i != size3 - 1) {
            if (nodes3[i] == 0) {
                printf("null,");
            } else {
                printf("%d,", nodes3[i]);
            }
        } else {
            if (nodes3[i] == 0) {
                printf("null");
            } else {
                printf("%d", nodes3[i]);
            }
        }
    }
    printf("]\n");

    printf("Output: ");
    inorderTraversal(root3);
    printf("\n");

    return 0;
}
