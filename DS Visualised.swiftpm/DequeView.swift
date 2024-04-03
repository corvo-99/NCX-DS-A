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
        NavigationView {
            ZStack {
                Color.gray.ignoresSafeArea()
                VStack {
                    Text("It is an abstract data type where elements in the collection can be added or removed from both ends.")
                        .font(.title3 .bold())
                        .padding()
                    ScrollView(showsIndicators: false) {
                        ForEach(Deque1, id: \.self) { element in
                                        Text(element)
                                .frame(width: 150, height: 50, alignment: .center)
                                            .padding()
                                            .background(Color.black)
                                            .foregroundColor(.white)
                                            .cornerRadius(8)
                                    }
                    }.frame(height: 400)
                    
                    VStack {
                        HStack {
                            Button("Prepend") {
                                Deque1.prepend("prepend")
                            }
                            .font(.title .bold())
                            .padding(.horizontal)
                            .padding(.vertical)
                            .background(Color.blue)
                            .cornerRadius(8)
                            
                            Button("PopFirst") {
                                Deque1.popFirst()
                            }
                            .font(.title .bold())
                            .padding(.horizontal)
                            .padding(.vertical)
                            .background(Color.red)
                            .cornerRadius(8)
                        }.padding(.bottom)
                        HStack {
                            Button("Append") {
                                Deque1.append("append")
                            }
                            .font(.title .bold())
                            .padding(.horizontal)
                            .padding(.vertical)
                            .background(Color.blue)
                            .cornerRadius(8)
                            
                            Button("PopLast") {
                                Deque1.popLast()
                            }
                            .font(.title .bold())
                            .padding(.horizontal)
                            .padding(.vertical)
                            .background(Color.red)
                            .cornerRadius(8)
                        }
                    }
                }
            }
            .foregroundColor(.white)
            .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Text("Deque")
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
    DequeView()
}
