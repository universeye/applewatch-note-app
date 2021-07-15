//
//  CreditsView.swift
//  DZNote WatchKit Extension
//
//  Created by Terry Kuo on 2021/7/15.
//

import SwiftUI

struct CreditsView: View {
    @State private var randomNumber: Int = Int.random(in: 1..<4)
    
    
    var body: some View {
        VStack(spacing: 3) {
            //Profile Image
            Image("profile-1")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .layoutPriority(1)
            //Header
            HeaderView(title: "Credits")
            //Contents
            
            Text("Universeye")
                .foregroundColor(.primary)
                .fontWeight(.bold)
                
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        } //: VStack
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
