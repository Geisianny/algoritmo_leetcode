class ListNode {
    int val;
    ListNode next;

    ListNode(int val) {
        this.val = val;
    }
}

class Solution206 {
    public ListNode reverseList(ListNode head) {
        ListNode prev = null;
        ListNode current = head;
        ListNode next;

        while (current != null) {
            next = current.next;
            current.next = prev;
            prev = current;
            current = next;
        }
        return prev;
    }

    public String getListString(ListNode head) {
        StringBuilder sb = new StringBuilder("[");
        while (head != null) {
            sb.append(head.val);
            if (head.next != null)
                sb.append(",");
            head = head.next;
        }
        sb.append("]");
        return sb.toString();
    }

    public static void entradas (String inputString ){
        System.out.println("Input: " + inputString);

        // Removendo os colchetes e espaços em branco da entrada
        inputString = inputString.replaceAll("\\[|\\]|\\s", "");

        if (inputString.isEmpty()) {
            System.out.println("Output: []");
            return;
        }

        // Dividindo a string pelos separadores ","
        String[] input = inputString.split(",");

        ListNode head = new ListNode(Integer.parseInt(input[0]));
        ListNode current = head;
        for (int i = 1; i < input.length; i++) {
            current.next = new ListNode(Integer.parseInt(input[i]));
            current = current.next;
        }

        Solution206 solution = new Solution206();
        ListNode reversedListHead = solution.reverseList(head);

        System.out.println("Output: " + solution.getListString(reversedListHead));
    }

    public static void main(String[] args) {

        String inputString = "[1,2,3,4,5]";
        entradas(inputString);
        System.out.println();

        inputString = "[1,2]";
        entradas(inputString);
        System.out.println();
        
        inputString = "[]";
        entradas(inputString);
        System.out.println();
    }
}
