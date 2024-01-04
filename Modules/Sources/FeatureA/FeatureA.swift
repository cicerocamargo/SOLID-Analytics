import SwiftUI

public struct SomethingHappenedInFeatureA {}

public protocol FeatureATracker {
    func track(_ event: SomethingHappenedInFeatureA)
}

public final class CompositeFeatureATracker: FeatureATracker {
    var children: [FeatureATracker] = []

    public func addChild(_ child: FeatureATracker) {
        children.append(child)
    }

    public func track(_ event: SomethingHappenedInFeatureA) {
        children.forEach {
            $0.track(event)
        }
    }
}

public let tracker = CompositeFeatureATracker()

public struct FeatureARootView: View {
    public init() {}

    public var body: some View {
        Button("Track Event From A") {
            tracker.track(SomethingHappenedInFeatureA())
        }
    }
}
