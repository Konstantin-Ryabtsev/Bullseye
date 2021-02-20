//
//  ContentView.swift
//  Bullseye
//
//  Created by Konstantin on 10.02.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderValue = 50.0
    @State private var alertHitMeIsVisible = false
    @State private var game = Game()
        
    var body: some View {
        VStack {
            VStack {
                Text("🎯🎯🎯\n PUT THE BULLYE AS CLOSE AS YOU CAN TO")
                    .bold()
                    .kerning(2.0)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                    .font(.footnote)
                Text(String(game.target))
                    .fontWeight(.black)
                    .kerning(-1.0)
                    .font(.largeTitle)
            }
            HStack {
                Text("  1").font(.body).bold()
                Slider(value: $sliderValue, in: 1.00...100.0)
                Text("100").font(.body).bold()
            }
            Button(action: {
                //print("Hello, SwiftUI!")
                alertHitMeIsVisible = true
            }) {
                Text("Hit me")
            }
            .alert(isPresented: $alertHitMeIsVisible, content: {
                let roundedValue = Int(sliderValue.rounded())
                return Alert(
                    title: Text("Hello there!"),
                    message: Text("The slider's value is \(roundedValue).\n" +
                                    "You scored \(game.points(sliderValue: roundedValue)) points this round."),
                    dismissButton: .default(Text("Awesome!")))
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}
	
