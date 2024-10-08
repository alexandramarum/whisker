//
//  ContentView.swift
//  PetAPIDemo
//
//  Created by Alexandra Marum on 4/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSavedView = false
    @EnvironmentObject private var locationManager: LocationManager

    var body: some View {
        Group {
            if locationManager.hasLocationAccess {
                if let userLocation = locationManager.postalCode {
                    SwitchView(vm: PetViewModel(postalcode: userLocation))
                }
            } else {
                LoadingView()
            }
        }
        .onAppear {
            locationManager.requestLocation()
        }
        .onChange(of: locationManager.hasLocationAccess) { _, hasLocationAccess in
            if hasLocationAccess {
                locationManager.requestLocation()
            }
        }
    }
}

#Preview {
    ContentView().environmentObject(LocationManager())
}
