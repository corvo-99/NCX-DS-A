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
        NavigationView {
            ZStack {
                Color.gray.ignoresSafeArea()
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
                                .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            .padding()
                                            .background(Color.black)
                                            .foregroundColor(.white)
                                            .cornerRadius(8)
                                    }
                    }.frame(height: 400)
                    
                    HStack {
                        Button("Push") {
                            BookStack.push("New element")
                        }
                        .font(.title .bold())
                        .padding(.horizontal, 50)
                        .padding(.vertical)
                        .background(Color.blue)
                        .cornerRadius(8)
                        
                        Button("Pop") {
                            BookStack.pop()
                        }
                        .font(.title .bold())
                        .padding(.horizontal, 50)
                        .padding(.vertical)
                        .background(Color.red)
                        .cornerRadius(8)
                    }
                }
            }
            .foregroundColor(.white)
            .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Text("Stack")
                                    .font(.largeTitle .bold())
                                    .foregroundColor(.white)
                                    //.padding(.horizontal)
                                    .padding(.top, 50.0)
                            }
                        }
        }
        
    }
}

#Preview {
    StackView()
}
