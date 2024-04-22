//
//  SwipeView.swift
//  PetAPIDemo
//
//  Created by Ben Chesser on 4/10/24.
//

import SwiftUI

struct SwipeView: View {
    @StateObject var vm: PetViewModel

    var body: some View {
        TabView {
            VStack {
                ZStack {
                    Image("whisker-bg2")
                        .resizable()
                        .ignoresSafeArea()
                        .scaledToFill()
                    ForEach(vm.pets, id: \.self) { pet in
                        let index = vm.pets.firstIndex(of: pet)
                        CardView(vm: PetCardViewModel(pet: pet, included: vm.included[index!]))
                    }
                }
            }
                .tabItem {
                    Label("Swipe", systemImage: "arrowshape.left.arrowshape.right.fill")
                }
                .toolbarBackground(.visible, for: .tabBar)
                SavedView()
                    .tabItem {
                        Label("Saved", systemImage: "heart.fill")
                            .padding(.top)
                    }
                    .toolbarBackground(.visible, for: .tabBar)
            }
        .accentColor(Color.pink1)
        }
    }

//#Preview {
//    NavigationStack {
//        SwipeView(vm: PetViewModel())
//    }
//}
