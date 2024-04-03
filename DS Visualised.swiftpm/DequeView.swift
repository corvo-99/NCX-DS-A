//
//  DequeView.swift
//  DS Visualised
//
//  Created by Dylan Corvo on 03/04/24.
//

import SwiftUI
import DequeModule
struct DequeView: View {
    @State var Deque1: Deque = ["A", "B", "C"]
    var body: some View {
        NavigationStack {
            VStack {
                Text("It is an abstract data type where elements in the collection can be added or removed from both ends.")
                    .font(.title3 .bold())
                    .padding()
                ScrollView(showsIndicators: false) {
                    ForEach(Deque1, id: \.self) { element in
                        Text(element)
                            .frame(width: 150, height: 10, alignment: .center)
                            .padding()
                            .background(Color.cyan)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                VStack {
                    HStack {
                        Button("Prepend") {
                            Deque1.prepend("prepend")
                        }
                        .font(.title .bold())
                        .padding(.horizontal)
                        .padding(.vertical)
                        .background(Color.cyan)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        
                        Button("PopFirst") {
                            Deque1.popFirst()
                        }
                        .font(.title .bold())
                        .padding(.horizontal)
                        .padding(.vertical)
                        .background(Color.gray)
                        .foregroundColor(.cyan)
                        .cornerRadius(8)
                    }.padding(.bottom)
                    HStack {
                        Button("Append") {
                            Deque1.append("append")
                        }
                        .font(.title .bold())
                        .padding(.horizontal)
                        .padding(.vertical)
                        .background(Color.cyan)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        
                        Button("PopLast") {
                            Deque1.popLast()
                        }
                        .font(.title .bold())
                        .padding(.horizontal)
                        .padding(.vertical)
                        .background(Color.gray)
                        .foregroundColor(.cyan)
                        .cornerRadius(8)
                    }
                }
            }
            .navigationTitle("Deque")
        }
    }
}

#Preview {
    DequeView()
}
