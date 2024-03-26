//
//  Stack example.swift
//  DS Visualised
//
//  Created by Dylan Corvo on 26/03/24.
//

import Foundation

struct Stack<Element: Equatable>: Equatable {
    
    private var internalStorage: [Element] = []
    
    var isEmpty: Bool {
        return peek() == nil
    }
    
    init() {}
    
    init(_ elements: [Element]) {
        self.internalStorage = elements
    }
    
    mutating func push(_ element: Element) {
        self.internalStorage.append(element)
    }
    
    @discardableResult
    mutating func pop() -> Element? {
        return self.internalStorage.popLast()
    }
    
    func peek() -> Element? {
        return self.internalStorage.last
    }
}


extension Stack: CustomStringConvertible {
    var description: String {
        return internalStorage.map{ "\($0)" }.joined(separator: ", ")
    }
}

var numberStack = Stack<Int>()
//numberStack.push(1)
//numberStack.push(2)
