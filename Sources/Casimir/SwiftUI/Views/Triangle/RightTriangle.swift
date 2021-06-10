import SwiftUI

public struct RightTriangle: Shape {
    public enum RightAnglePosition: Int, CaseIterable {
        case topLeft, topRight, bottomRight, bottomLeft
    }
    public let position: RightAnglePosition

    public func path(in rect: CGRect) -> Path {
        switch position {
        case .topLeft:
            return Path.triangle(verticeA: CGPoint(x: rect.minX, y: rect.minY),
                                 verticeB: CGPoint(x: rect.maxX, y: rect.minY),
                                 verticeC: CGPoint(x: rect.minX, y: rect.maxY))
        case .topRight:
            return Path.triangle(verticeA: CGPoint(x: rect.maxX, y: rect.minY),
                                 verticeB: CGPoint(x: rect.maxX, y: rect.maxY),
                                 verticeC: CGPoint(x: rect.minX, y: rect.minY))
        case .bottomRight:
            return Path.triangle(verticeA: CGPoint(x: rect.maxX, y: rect.maxY),
                                 verticeB: CGPoint(x: rect.maxX, y: rect.minY),
                                 verticeC: CGPoint(x: rect.minX, y: rect.maxY))
        case .bottomLeft:
            return Path.triangle(verticeA: CGPoint(x: rect.minX, y: rect.maxY),
                                 verticeB: CGPoint(x: rect.minX, y: rect.minY),
                                 verticeC: CGPoint(x: rect.maxX, y: rect.maxY))
        }
    }
}

private extension Path {
    static func triangle(verticeA: CGPoint, verticeB: CGPoint, verticeC: CGPoint) -> Path {
        var path = Path()
        path.move(to: verticeA)
        path.addLine(to: verticeB)
        path.addLine(to: verticeC)
        path.addLine(to: verticeA)
        return path
    }
}

struct SwiftUIPreviewRightTriangle: PreviewProvider {
    static var previews: some View {
        ForEach(RightTriangle.RightAnglePosition.allCases.indices) { index in
            RightTriangle(position: RightTriangle.RightAnglePosition(rawValue: index)!)
                .fill(Color.orange)
                .previewDisplayName(String(describing: RightTriangle.RightAnglePosition(rawValue: index)!))
                .previewLayout(.fixed(width: 128, height: 128))
        }
    }
}