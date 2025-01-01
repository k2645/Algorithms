import Foundation

final class Node<T: Comparable> {
    var element: T
    var leftNode: Node<T>?
    var rightNode: Node<T>?
    
    init(element: T, leftNode: Node<T>? = nil, rightNode: Node<T>? = nil) {
        self.element = element
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}

final class BinarySearchTree<T: Comparable> {
    var root: Node<T>?
    
    func insert(_ element: T) {
        guard let root else { return root = Node(element: element) }
        
        var currentNode = root
        while true {
            if element == currentNode.element { return }
            
            if element < currentNode.element {
                guard let leftNode = currentNode.leftNode else {
                    return currentNode.leftNode = Node(element: element)
                }
                currentNode = leftNode
            } else {
                guard let rightNode = currentNode.rightNode else {
                    return currentNode.rightNode = Node(element: element)
                }
                currentNode = rightNode
            }
        }
    }
    
    func search(_ element: T) -> Node<T>? {
        var currentNode = root
        while let node = currentNode {
            if element == node.element { break }
            currentNode = element < node.element ? node.leftNode : node.rightNode
        }
        
        return currentNode
    }
}
