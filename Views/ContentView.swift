//
//  ContentView.swift
//  MusicByLocation
//
//  Created by Freddie H on 08/03/2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var locationHandler = LocationHandler()
    
    var body: some View {
        VStack {
            Text(locationHandler.lastKnownLocation)
                .padding()
            Spacer()
            Button("Find music", action: {
                locationHandler.requestLocation()
            })
        } .onAppear(perform: {
            locationHandler.requestAuthorisation()
        })
    }
}

#Preview {
    ContentView()
}
