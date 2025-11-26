//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Ajay Yamamoto on 2025-11-15.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var picture = ""
    var body: some View {
        
        VStack {
            Spacer()
            
            Image(systemName: picture)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
                .foregroundStyle(.black)
            
            Spacer()
            
            Button ("Press Me!") {
                let message1 = "You are awesome!"
                let message2 = "You are great!"
                let imageString1 = "hand.thumbsup"
                let imageString2 = "sun.max.fill"
                
                if message == message1 {
                    message = message2
                    picture = imageString1
                } else {
                    message = message1
                    picture = imageString2
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
            
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}

