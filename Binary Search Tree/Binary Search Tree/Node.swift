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
