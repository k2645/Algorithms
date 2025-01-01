import Foundation

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

extension BinarySearchTree {
    func drawDiagram() {
        print(diagram(for: self.root))
    }
    
    private func diagram(for node: Node<T>?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.leftNode == nil && node.rightNode == nil {
            return root + "\(node.element)\n"
        }
        return diagram(for: node.rightNode, top + " ", top + "┌──", top + "│ ")
            + root + "\(node.element)\n"
        + diagram(for: node.leftNode, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}
