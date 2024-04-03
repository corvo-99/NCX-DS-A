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
        Text("")
            .onAppear(perform: {
                BookStack.push("a")
                BookStack.push("b")
                BookStack.push("c")
                BookStack.push("d")
            })
        ForEach(BookStack, id: \.self) { element in
                        Text(element)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
    }
}

#Preview {
    StackView()
}
