import FeatureA
import FeatureB
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FeatureARootView()
                .tabItem { Text("Feature A") }

            FeatureBRootView()
                .tabItem { Text("Feature B") }
        }
    }
}

#Preview {
    ContentView()
}
