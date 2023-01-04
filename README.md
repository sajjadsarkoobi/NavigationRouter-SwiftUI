# NavigationRouter-SwiftUI

## Features:
- Support Tabbar
- Double Tap on tab Icon to pop to root like UITabbar in UIKit
- Universal Router that can find the view of each route

You can add all Paths of your app here:
```Swift
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
```

And when using NavigationLink in NavigationStack
```Swift
NavigationLink(value: Paths.secondView) {
    Text("Goto Seconds")
}
```


It can automatically find the view and return it as a Navigation destination.
So we can have multiple NavigationStack for each Tab but just one Router for all of them.
```Swift
.navigationDestination(for: Paths.self) { path in
    path.view
}
```

## Author:

- [@Sajjad Sarkoobi](https://www.github.com/sajjadsarkoobi)
- [LinkedIn](https://www.linkedin.com/in/sajjad-sarkoobi/)
- sajjadsarkoobi@gmail.com
