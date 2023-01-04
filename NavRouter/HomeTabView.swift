//
//  HomeTabView.swift
//  NavRouter
//
//  Created by Sajjad Sarkoobi on 3.01.2023.
//

import SwiftUI

struct HomeTabView: View {
    
    @EnvironmentObject var navigation: Router
    
    var body: some View {
        ZStack {
            VStack {
                NavigationLink(value: Paths.secondView) {
                    Text("Goto Seconds")
                }
            }
        }
    }
}

struct HomeTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
