//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Ajay Yamamoto on 2025-11-15.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    let numberOfImages = 10
    let numberOfSounds = 6
    var body: some View {
        
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 120)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            
            Spacer()
            
            Button ("Show Message") {
                let messages = ["You Are Awesome!",
                                "Gadzooks my friend! I am astonished at how utterly magnificent you are!",
                                "Fabulous? That's You!",
                                "You Swifty!",
                                "You Are Magic!",
                                "When the Genius Bar Needs Help, They Call You!"]
                
                //For message
                lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBounds: messages.count - 1)
                message = messages[lastMessageNumber]
                
                //For image
                lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBounds: numberOfImages - 1)
                imageName = "image\(lastImageNumber)"
                
                
                //For sound
                lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBounds: numberOfSounds - 1)
                playSound(soundName: "sound\(lastSoundNumber)")
                
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
            
        }
        .padding()
        
    }
    
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("🤬 Could not read file named \(soundName)")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("🤬 ERROR: \(error.localizedDescription) creating audioPlayer")
        }
    }
    
    func nonRepeatingRandom (lastNumber: Int, upperBounds: Int) -> Int {
        var number: Int
        repeat {
            number = Int.random(in: 0...upperBounds)
        } while number == lastNumber
        return number
    }
}

#Preview {
    ContentView()
}

