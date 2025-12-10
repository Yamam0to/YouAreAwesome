//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Ajay Yamamoto on 2025-11-15.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var imageNumber = 0
    @State private var messagesNumber = 0
    var body: some View {
        
        VStack {
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button ("Show Message") {
                let messages = ["You Are Awesome!",
                                "Fabulous? That's You!",
                                "You Swifty!",
                                "You Are Magic!",
                                "When the Genius Bar Needs Help, They Call You!"]
                message = messages[messagesNumber]
                messagesNumber += 1
                
                if messagesNumber == messages.count {
                    messagesNumber = 0
                }
                
                imageName = "image\(imageNumber)"
                imageNumber += 1
                
                if imageNumber > 9 {
                    imageNumber = 0
                }
                
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
            
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}

