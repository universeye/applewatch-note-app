//
//  DetailView.swift
//  DZNote WatchKit Extension
//
//  Created by Terry Kuo on 2021/7/14.
//

import SwiftUI

struct DetailView: View {
    
    let note: Note
    let count: Int
    let index: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            //Header
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            } //: HStack
            .foregroundColor(.accentColor)
            //Content
            
            Spacer()
            
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            //Footer
            
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                
                Spacer()
                
                Text("\(count) / \(index + 1)")
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
            } //: Hstack
            .foregroundColor(.secondary)
        } //: Vstack
        .padding(3)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var sampleData = Note(id: UUID(), text: "Hello World!")
    static var previews: some View {
        DetailView(note: sampleData, count: 5, index: 1)
    }
}
