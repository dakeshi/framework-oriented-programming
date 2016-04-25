import Foundation
#if os(OSX)
import AppKit
#else
import UIKit
#endif

public struct Font {
    
    // MARK: - Attributes
    
    internal let name: String
    internal let size: CGFloat
    
    
    // MARK: - Init
    
    public init(name: String, size: CGFloat) {
        self.name = name
        self.size = size
    }
    
}