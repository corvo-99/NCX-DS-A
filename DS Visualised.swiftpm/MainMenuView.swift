//
//  MainMenuView.swift
//  DS Visualised
//
//  Created by Dylan Corvo on 03/04/24.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        NavigationStack{
                List {
                    Section {
                        NavigationLink{
                            StackView()
                                .navigationBarTitle("Stack", displayMode: .inline)
                        } label: {
                            Text("Stack")
                        }
                        NavigationLink{
                            DequeView()
                                .navigationBarTitle("Deque", displayMode: .inline)
                        } label: {
                            Text("Deque")
                        }
                    } header: { Text("Linear data structures") }
                    Section {
                        NavigationLink{
                            TreeView()
                                .navigationBarTitle("Tree", displayMode: .inline)
                        } label: {
                            Text("Tree")
                        }
                        NavigationLink{
                            Text("Work in progress") 
                        } label: {
                            Text("Hash Tables")
                        }
                        NavigationLink{
                            Text("Work in progress")
                        } label: {
                            Text("Heaps")
                        }
                    } header: {
                        Text("Non-Linear data structures")
                    }
                }
                .navigationTitle("DS Visualised")
        }.tint(.cyan)
    }
}

#Preview {
    MainMenuView()
}
