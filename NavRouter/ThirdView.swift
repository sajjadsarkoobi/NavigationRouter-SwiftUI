//
//  ThirdView.swift
//  NavRouter
//
//  Created by Sajjad Sarkoobi on 3.01.2023.
//

import SwiftUI

struct ThirdView: View {
    
    @EnvironmentObject var navigation: Router
    
    var body: some View {
        VStack {
            
            NavigationLink(value: Paths.secondView) {
                Text("go to Second View")
            }

            Button("Go Back") {
                navigation.popToPrevious()
            }
            
            Button("Pop to root") {
                navigation.popToRoot()
            }

            .navigationTitle("Third view")
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
