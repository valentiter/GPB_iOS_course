import Foundation


//Implement a generic class for a Stack, Deque or Queue data structure.
//The class must contain generic methods according to the selected data structure type.
//In the Playground main space, write an example using the created class



class Node<T> {
    var value: T
    var next: Node?
    var prev: Node?

    init(value: T) {
        self.value = value
    }
}

class Queue<T> {

    private var head: Node<T>?
    private var tail: Node<T>?

    var isEmpty: Bool {
        get {
            return head == nil
        }
    }

    func add(value: T) {
        if head == nil {
            let node = Node(value: value)
            head = node
            tail = node
            head?.next = tail
            tail?.prev = head
        }  else {
            let curr = tail
            tail = Node(value: value)
            curr?.next = tail
            tail?.prev = curr
        }
    }

    func peek() -> T? {
        return head?.value
    }

    func poll() -> T? {
        if let value = head?.value {
            head = head?.next
            return value
        }
        return nil
    }
}
