
import SwiftUI
import PlaygroundSupport
struct ContentView: View {
    
    
    var body: some View {
        
        Text("a")
    }
    
}
//Stack
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
numberStack.push(1)
numberStack.push(2)
PlaygroundPage.current.setLiveView(ContentView())

//tree
struct Node<Value> {
    var value: Value
    private(set) var children: [Node]
    var count: Int {
        1+children.reduce(0) { $0 + $1.count }
    }
    
    init(_ value: Value) {
        self.value = value
        children = []
    }
    
    init(_ value: Value, children: [Node]) {
        self.value = value
        self.children = children
    }
    
    init(_ value: Value, @NodeBuilder builder: () -> [Node]) {
        self.value = value
        self.children = builder()
    }
    
    mutating func add(child: Node) {
        children.append(child)
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

@resultBuilder
struct NodeBuilder {
    static func buildBlock<Value>(_ children: Node<Value> ...) -> [Node<Value>] {
        children
    }
}
//example tree
let corvo = Node("corvo") {
    Node("pelusa") {
        Node("pelusita")
        Node("negri")
    }
    Node("play") {
        Node("GoW")
        Node("Uncharted")
    }
}
print(corvo.count)
