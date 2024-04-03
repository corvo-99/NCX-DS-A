//
//  StackView.swift
//  DS Visualised
//
//  Created by Dylan Corvo on 03/04/24.
//

import SwiftUI

struct StackView: View {
    @State var BookStack = Stack<String>()
    var body: some View {
        NavigationStack {
            VStack {
                Text("A Stack is a linear data structure that follows the Last In, First Out (LIFO) principle.")
                    .font(.title3 .bold())
                    .onAppear(perform: {
                        BookStack.push("Example element")
                        BookStack.push("Example element")
                        BookStack.push("Example element")
                    })
                ScrollView(showsIndicators: false) {
                    ForEach(BookStack, id: \.self) { element in
                        Text(element)
                            .frame(width: 150, height: 10, alignment: .center)
                            .padding()
                            .background(Color.cyan)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                HStack {
                    Button("Push") {
                        BookStack.push("New element")
                    }
                    .font(.title .bold())
                    .padding(.horizontal, 50)
                    .padding(.vertical)
                    .background(Color.cyan)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    
                    Button("Pop") {
                        BookStack.pop()
                    }
                    .font(.title .bold())
                    .padding(.horizontal, 50)
                    .padding(.vertical)
                    .background(Color.gray)
                    .foregroundColor(.cyan)
                    .cornerRadius(8)
                }
            }
        }
        .navigationTitle("Stack")
    }
}


#Preview {
    StackView()
}
