//
//  Helper.swift
//  
//
//  Created by 김영현 on 2023/06/06.
//

import Foundation

public func example(of: description: String, action: () -> ()) {
    print("---Example of \(description)---")
    action()
    print()
}
