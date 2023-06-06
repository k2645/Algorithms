//
//  Stack.swift
//  
//
//  Created by 김영현 on 2023/06/06.
//

import Foundation

public struct Stack<Element> {
    
    // MARK: - storage : 배열로 설정
    private var storage = Array<Element>()
    public init(_ element: [Element]) {
        storage = element
    }
    public init() {}
    
    // MARK: push 함수
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    // MARK: pop 함수
    @discardableResult
    public mutating func pop() -> Element? {
        return storage.popLast()
    }
    
    // MARK: useful 메소드
    public func peek() -> Element? {
        return storage.last
    }
    
    public func isEmpty: Bool {
        return peek() == nil
    }
    
}

extension Stack: CustomStringConvertible {
    
    // description을 정의하는 protocol
    public var description: String {
        
        let topDivider = "--- top ---\n"
        let bottomDivider = "\n ----------"
        
        let stackElements = storage
            .map {
            (i) in "\(i)"
        }.reversed()
        .joined(separator: "\n")
        
        return topDivider + stackElements + bottomDivider
        
    }
}
