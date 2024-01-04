import FeatureA
import FeatureB
import FirebaseAnalytics

struct FirebaseAnalyticsFeatureATracker: FeatureATracker {
    func track(_ event: FeatureA.SomethingHappenedInFeatureA) {
        Analytics.logEvent(
            "Something Happened In Feature A",
            parameters: nil
        )
    }
}

#if DEBUG
struct SystemLogFeatureATracker: FeatureATracker {
    func track(_ event: FeatureA.SomethingHappenedInFeatureA) {
        print("Something Happened In Feature A")
    }
}
#endif


struct FirebaseAnalyticsFeatureBTracker: FeatureBTracker {
    func track(_ event: FeatureB.SomethingHappenedInFeatureB) {
        Analytics.logEvent(
            "Something Happened In Feature B",
            parameters: nil
        )
    }
}


import SwiftUI

@main
struct AnalyticsApp: App {
    init() {
        FeatureA.tracker.addChild(FirebaseAnalyticsFeatureATracker())
        FeatureA.tracker.addChild(SystemLogFeatureATracker())
        FeatureB.tracker = FirebaseAnalyticsFeatureBTracker()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
