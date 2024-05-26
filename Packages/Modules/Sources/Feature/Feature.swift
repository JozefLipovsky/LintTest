import SwiftUI
import Foundation

public struct Feature {

    let someForceCast = NSObject() as! Int
    let colonOnWrongSide :Int = 0

    public init() {}
}

public extension Feature {
    enum NestedEnum {
        public enum ViewAction {}
        public enum DelegateAction {}

        case view(ViewAction)
        case delegate(DelegateAction)
    }
}
