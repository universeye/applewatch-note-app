//
//  ContentView.swift
//  DZNote WatchKit Extension
//
//  Created by Terry Kuo on 2021/7/13.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Property
    
    @State private var note: [Note] = []
    @State private var text: String = ""
    // MARK: - Function
    // MARK: - Body
    
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
        } //: VStack
        .navigationTitle("Notes")
    }
}



// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
