/*
 See LICENSE folder for this sample’s licensing information.
 */

import UIKit

extension CAGradientLayer {
    
    public enum GradientDirection {
        case horizontal
        case vertical
        case diagonal
        case diagonalReversed // 从右上到左下的对角线
    }

    public func setGradientColors(_ colors: [CGColor], direction: GradientDirection) {
        self.colors = colors

        switch direction {
        case .horizontal:
            startPoint = CGPoint(x: 0.0, y: 0.5)
            endPoint = CGPoint(x: 1.0, y: 0.5)
        case .vertical:
            startPoint = CGPoint(x: 0.5, y: 0.0)
            endPoint = CGPoint(x: 0.5, y: 1.0)
        case .diagonal:
            startPoint = CGPoint(x: 0.0, y: 0.0)
            endPoint = CGPoint(x: 1.0, y: 1.0)
        case .diagonalReversed:
            startPoint = CGPoint(x: 1.0, y: 0.0)
            endPoint = CGPoint(x: 0.0, y: 1.0)
        }
    }
}
