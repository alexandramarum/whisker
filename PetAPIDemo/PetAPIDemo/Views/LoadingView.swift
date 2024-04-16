//
//  LoadingView.swift
//  PetAPIDemo
//
//  Created by Alexandra Marum on 4/10/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack{
            Text("Finding your purrrfect pet match is just a 'paw' away...")
                .font(.title2)
                .fontWeight(.medium)
                .italic()
                .padding()
                .multilineTextAlignment(.center)
            Image("dogandcat")
                .resizable()
                .scaledToFit()
            Text("Welcome to Whisker!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
        }
    }
}

#Preview {
    LoadingView()
}
