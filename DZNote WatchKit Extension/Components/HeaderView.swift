//
//  HeaderView.swift
//  DZNote WatchKit Extension
//
//  Created by Terry Kuo on 2021/7/15.
//

import SwiftUI

struct HeaderView: View {
    
    var title: String = ""
    
    var body: some View {
        VStack {
            //Title
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
            //Seperator
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            } //: HStack
            .foregroundColor(.accentColor)
        } //: VStack
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(title: "test").previewLayout(.sizeThatFits)
            
            HeaderView().previewLayout(.sizeThatFits)
        }
    }
}
