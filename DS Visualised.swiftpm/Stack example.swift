//
//  Stack example.swift
//  DS Visualised
//
//  Created by Dylan Corvo on 26/03/24.
//

import Foundation

struct Stack<Element: Equatable>: RandomAccessCollection, MutableCollection  {
    
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
    
    typealias Index = Int
    
    var startIndex: Index { return 0 }
    var endIndex: Index { return internalStorage.count }
    
    subscript(position: Index) -> Element {
            get { return internalStorage[position] }
            set { internalStorage[position] = newValue }
        }
    
    func index(after i: Index) -> Index {
            return internalStorage.index(after: i)
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
