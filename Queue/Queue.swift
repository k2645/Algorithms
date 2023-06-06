//
//  Queue.swift
//  
//
//  Created by 김영현 on 2023/06/06.
//

import Foundation

public protocol Queue {
    associatedtype Element
    
    mutating func enQueue(_ element: Element) -> Bool
    mutating func deQueue() -> Element?
    
    var isEmpty: Bool { get }
    var peek: Element? { get }
    
}
