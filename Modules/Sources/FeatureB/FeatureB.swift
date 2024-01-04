import SwiftUI

public struct SomethingHappenedInFeatureB {}

public protocol FeatureBTracker {
    func track(_ event: SomethingHappenedInFeatureB)
}

public var tracker: FeatureBTracker!

public struct FeatureBRootView: View {
    public init() {}

    public var body: some View {
        Button("Track Event From B") {
            tracker.track(SomethingHappenedInFeatureB())
        }
    }
}
