import Foundation

struct Heap<T: Comparable> {
    private var elements: [T] = []
    private let sortFunction: (T, T) -> Bool
    
    var isEmpty: Bool { elements.isEmpty || elements.count == 1 }
    var count: Int { elements.count - 1 }
    var peek: T? {
        if isEmpty { return nil }
        return elements[1]
    }
    
    init(sortFunction: @escaping (T, T) -> Bool) {
        self.sortFunction = sortFunction
    }
    
    mutating func push(_ element: T) {
        if isEmpty { return elements = [element, element] }
        elements.append(element)
        swimUp(count)
    }
    
    mutating func pop() -> T? {
        if isEmpty { return nil }
        
        elements.swapAt(1, count)
        let popElement = elements.popLast()
        diveDown(1)
        return popElement
    }
    
    mutating func swimUp(_ index: Int) {
        var currentIndex = index
        while currentIndex != 1 && sortFunction(elements[currentIndex], elements[parent(of: currentIndex)]) {
            elements.swapAt(currentIndex, parent(of: currentIndex))
            currentIndex = parent(of: currentIndex)
        }
    }
    
    mutating func diveDown(_ index: Int) {
        var higherPriorityIndex = index
        let leftIndex = leftChild(of: higherPriorityIndex)
        let rightIndex = rightChild(of: higherPriorityIndex)
        
        if leftIndex <= count && sortFunction(elements[leftIndex], elements[higherPriorityIndex]) {
            higherPriorityIndex = leftIndex
        }
        
        if rightIndex <= count && sortFunction(elements[rightIndex], elements[higherPriorityIndex]) {
            higherPriorityIndex = rightIndex
        }
        
        if higherPriorityIndex != index {
            elements.swapAt(higherPriorityIndex, index)
            diveDown(higherPriorityIndex)
        }
    }
    
    func leftChild(of index: Int) -> Int {
        return index * 2
    }
    
    func rightChild(of index: Int) -> Int {
        return index * 2 + 1
    }
    
    func parent(of index: Int) -> Int {
        return index / 2
    }
}
