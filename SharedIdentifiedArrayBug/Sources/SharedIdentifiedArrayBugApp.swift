
import SharedIdentifiedArrayBugFramework
import ComposableArchitecture
import SwiftUI

@main
struct SharedIdentifiedArrayBugApp: App {
        
    static let store: StoreOf<Content> = .init(
        initialState: .init(),
        reducer: {
            Content()
                ._printChanges()
        }
    )
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: Self.store)
        }
    }
}

