//
//  TreeView.swift
//  DS Visualised
//
//  Created by Dylan Corvo on 03/04/24.
//
import SwiftUI
import Foundation

struct TreeView: View {
    @State private var familyTree = Node("GrandFather") {
        Node("Mother") {
            Node("Daughter")
            Node("Son")
        }
    }
    
    var body: some View {
        NavigationView {
            VStack() {
                Text("A tree is a hierarchical structure with nodes connected by edges, resembling a branching pattern. It efficiently organizes data, relationships, or hierarchies for various applications.")
                    .font(.title3 .bold())
                FamilyTreeNodeView(node: $familyTree)
                HStack() {
                    addButton()
                    removeButton()
                }
            }
            
        }
    }
    
    private func addButton() -> some View {
        Button(action: addChild) {
            Text("Add child")
                .font(.title3 .bold())
                .padding(.horizontal, 50)
                .padding(.vertical)
                .background(Color.cyan)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
    
    private func removeButton() -> some View {
        Button(action: removeChild) {
            Text("Remove")
                .font(.title3 .bold())
                .padding(.horizontal, 50)
                .padding(.vertical)
                .background(Color.gray)
                .foregroundColor(.cyan)
                .cornerRadius(8)
                .disabled(familyTree.children.isEmpty)
        }
    }
    
    private func addChild() {
        var newNode = familyTree
        newNode.add(child: Node("New Child"))
        familyTree = newNode
    }
    
    private func removeChild() {
        if !familyTree.children.isEmpty {
            var newNode = familyTree
            newNode.children.removeLast()
            familyTree = newNode
        }
    }
    
    struct FamilyTreeNodeView: View {
        @Binding var node: Node<String>
        
        var body: some View {
            VStack {
                ScrollView(showsIndicators: false) {
                    Text(node.value)
                        .frame(width: 150, height: 10, alignment: .center)
                        .padding()
                        .background(Color.cyan)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    ForEach(node.children) { child in
                        HStack {
                            Spacer(minLength: 1 * CGFloat(child.depth))
                            FamilyTreeNodeView(node: .constant(child))
                        }
                    }}
            }.padding()
        }
    }
}

#Preview {
    TreeView()
}

