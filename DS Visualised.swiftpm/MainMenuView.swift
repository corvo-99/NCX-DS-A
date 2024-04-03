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
                    NavigationLink{
                        StackView()
                    } label: {
                        Text("Stack")
                    }
                    NavigationLink{
                        DequeView()
                    } label: {
                        Text("Deque")
                    }
                }
                .navigationTitle("DS Visualised")
        }.tint(.cyan)
    }
}

#Preview {
    MainMenuView()
}
