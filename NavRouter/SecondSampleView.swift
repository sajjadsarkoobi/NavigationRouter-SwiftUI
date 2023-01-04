//
//  SecondView.swift
//  NavRouter
//
//  Created by Sajjad Sarkoobi on 3.01.2023.
//

import SwiftUI

struct SecondView: View {
    
    @EnvironmentObject var navigation: Router
    
    var body: some View {
        VStack {
            
            NavigationLink(value: Paths.thirdView) {
                Text("go to Third View")
            }

            Button("Go Back") {
                navigation.popToPrevious()
            }
            
            Button("Pop to root") {
                navigation.popToRoot()
            }

            .navigationTitle("Second view")
        }
    }
}

struct SecondSampleView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
