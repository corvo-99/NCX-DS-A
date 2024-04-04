//
//  Tree example.swift
//  DS Visualised
//
//  Created by Dylan Corvo on 26/03/24.
//

import Foundation

struct Node<Value>: RandomAccessCollection,Identifiable {
    var id = UUID()
    var value: Value
    var children: [Node] = []
    
    init(_ value: Value) {
        self.value = value
        children = []
    }
    
    init(_ value: Value, children: [Node]) {
        self.value = value
        self.children = children
    }
    mutating func add(child: Node) {
            children.append(child)
        }
    
    init(_ value: Value, @NodeBuilder builder: () -> [Node]) {
        self.value = value
        self.children = builder()
    }
    
    func index(after i: Int) -> Int {
        return i + 1
    }
    
    var startIndex: Int { return 0 }
    var endIndex: Int { return children.count }
    
    subscript(position: Int) -> Node {
        return children[position]
    }
    
    var count: Int {
        1 + children.reduce(0) { $0 + $1.count }
    }
    
}

extension Node: Equatable where Value: Equatable { }
extension Node: Hashable where Value: Hashable { }
extension Node: Codable where Value: Codable { }

extension Node where Value: Equatable {
    func find(_ value: Value) -> Node? {
        if self.value == value {
            return self
        }
        for child in children {
            if let match = child.find(value) {
                return match
            }
        }
        return nil
    }
}

extension Node {
  var depth: Int {
    children.isEmpty ? 0 : 1 + children.first!.depth
  }
}
@resultBuilder
struct NodeBuilder {
    static func buildBlock<Value>(_ children: Node<Value> ...) -> [Node<Value>] {
        children
    }
}
