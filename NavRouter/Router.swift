//
//  Router.swift
//  NavRouter
//
//  Created by Sajjad Sarkoobi on 3.01.2023.
//

import Foundation
import SwiftUI

enum Paths {
    case secondView
    case thirdView
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .secondView:
            SecondView()
        case .thirdView:
            ThirdView()
        }
    }
}

class Router: ObservableObject {
    @Published var path = NavigationPath()
    
    func popToRoot() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.path = NavigationPath()
        }
    }
    
    func popToPrevious() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if !self.path.isEmpty {
                self.path.removeLast(1)
            }
        }
    }
}
