//
//  ContentView.swift
//  MusicByLocation
//
//  Created by Freddie H on 08/03/2024.
//

import SwiftUI

struct ContentView: View {
    
    let locationHandler = LocationHandler()
    
    var body: some View {
        VStack {
            Text("hello word")
                .padding()
            Spacer()
            Button("Find music", action: {})
        } .onAppear(perform: {
            locationHandler.requestAuthorisation()
        })
    }
}

#Preview {
    ContentView()
}
