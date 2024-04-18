//
//  SavedCardView.swift
//  PetAPIDemo
//
//  Created by Ben Chesser on 4/17/24.
//


import SwiftData
import SwiftUI

struct SavedCardView: View {
    @ObservedObject var vm: PetCardViewModel
    
    // Updated background to reflect system settings
    @State private var color: Color = .init(UIColor.systemBackground)
    
    @State private var showingMoreInfo: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 370, height: 630)
                .cornerRadius(15)
                .foregroundColor(color)
                .shadow(radius: 10)
            
            VStack {
                if let imageUrl = vm.pet.attributes.pictureThumbnailUrl {
                    AsyncImage(url: URL(string: imageUrl)) { phase in
                        if let image = phase.image {
                            image.resizable()
                                .scaledToFit()
                                .cornerRadius(15)
                                .frame(width: 250, height: 450)
                        } else if phase.error != nil {
                            missingImageCard()
                        } else {
                            ProgressView()
                        }
                    }
                } else {
                    missingImageCard()
                }
                
                VStack(alignment: .leading) {
                    // For when the name is long
                    Text(vm.getName())
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                        .bold()
                        .lineLimit(1)
                        .frame(height: 40)
                    Text(vm.getPrimaryBreed())
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .italic()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 80)
                .padding(.bottom, 10)
                
                Button {
                    withAnimation {
                        showingMoreInfo = true
                    }
                } label: {
                    HStack {
                        Text("Learn more about me!")
                            .font(.title3)
                            .foregroundColor(Color.white)
                            .bold()
                        
                        Image(systemName: "pawprint.fill")
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 30)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.pink, .yellow1]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(30)
                }
            }
            .sheet(isPresented: $showingMoreInfo) {
                DetailsView(vm: vm, showingMoreInfo: $showingMoreInfo)
            }
        }
    }
    
    @ViewBuilder
    func missingImageCard() -> some View {
        Image(systemName:"photo.artframe")
    }
    
}

#Preview {
    SavedCardView(vm: PetCardViewModel(pet: Animal.example, included: Included.example))
}
