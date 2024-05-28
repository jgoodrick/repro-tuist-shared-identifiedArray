
import ComposableArchitecture
import SwiftUI

public struct Item: Identifiable, Equatable, Codable, Sendable {
    public let id: UUID
}

extension PersistenceKey where Self == PersistenceKeyDefault<FileStorageKey<IdentifiedArrayOf<Item>>> {
    public static var items: Self {
        PersistenceKeyDefault(
            .fileStorage(URL.documentsDirectory.appending(component: "languageSelectionList.json")), []
        )
    }
}

@Reducer
public struct Content {
    public init() {}
    @ObservableState
    public struct State: Equatable {
        public init() {}
        @Shared(.items) var items
    }
}

public struct ContentView: View {
    
    public init(store: StoreOf<Content>) {
        self.store = store
    }
    
    let store: StoreOf<Content>

    public var body: some View {
        List(store.items) { item in
            Text(item.id.uuidString)
        }
    }
}


#Preview { Preview }
private var Preview: some View {
    ContentView(store: .init(initialState: .init(), reducer: { Content() }))
}
