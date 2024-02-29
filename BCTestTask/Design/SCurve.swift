//
//  SCurve.swift
//  BCTestTask
//
//  Created by Emilia Tothova on 25/02/2024.
//

import SwiftUI

struct TopSCurve: Shape {
    let radius: CGFloat = 40

    func path(in rect: CGRect) -> Path {
        Path { p in
            p.move(to: CGPoint(x: rect.minX, y: rect.minY - radius))
            p.addArc(
                tangent1End: CGPoint(x: rect.minX, y: rect.minY),
                tangent2End: CGPoint(x: rect.minX + radius, y: rect.minY),
                radius: radius
            )
            p.addLine(to: CGPoint(x: rect.maxX - radius, y: rect.minY))
            p.addArc(
                tangent1End: CGPoint(x: rect.maxX, y: rect.minY),
                tangent2End: CGPoint(x: rect.maxX, y: rect.minY + radius),
                radius: radius
            )
            p.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            p.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

struct BottomSCurve: Shape {
    let radius: CGFloat

    init(radius: CGFloat = 40) {
        self.radius = radius
    }

    func path(in rect: CGRect) -> Path {
        Path { p in
            p.move(to: CGPoint(x: rect.minX, y: rect.maxY - radius))
            p.addArc(
                tangent1End: CGPoint(x: rect.minX, y: rect.maxY),
                tangent2End: CGPoint(x: rect.minX + radius, y: rect.maxY),
                radius: radius
            )
            p.addLine(to: CGPoint(x: rect.maxX - radius, y: rect.maxY))
            p.addArc(
                tangent1End: CGPoint(x: rect.maxX, y: rect.maxY),
                tangent2End: CGPoint(x: rect.maxX, y: rect.maxY + radius),
                radius: radius
            )
            p.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            p.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            p.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        }
    }
}

struct TopAndBottomSCurve: Shape {
    let radius: CGFloat

    init(radius: CGFloat = 40) {
        self.radius = radius
    }

    func path(in rect: CGRect) -> Path {
        Path { p in
            p.move(to: CGPoint(x: rect.minX, y: rect.minY - radius))
            p.addArc(
                tangent1End: CGPoint(x: rect.minX, y: rect.minY),
                tangent2End: CGPoint(x: rect.minX + radius, y: rect.minY),
                radius: radius
            )
            p.addLine(to: CGPoint(x: rect.maxX - radius, y: rect.minY))
            p.addArc(
                tangent1End: CGPoint(x: rect.maxX, y: rect.minY),
                tangent2End: CGPoint(x: rect.maxX, y: rect.minY + radius),
                radius: radius
            )
            p.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY + radius))
            p.addArc(
                tangent1End: CGPoint(x: rect.maxX, y: rect.maxY),
                tangent2End: CGPoint(x: rect.maxX - radius, y: rect.maxY),
                radius: radius
            )
            p.addLine(to: CGPoint(x: rect.minX + radius, y: rect.maxY))
            p.addArc(
                tangent1End: CGPoint(x: rect.minX, y: rect.maxY),
                tangent2End: CGPoint(x: rect.minX, y: rect.maxY - radius),
                radius: radius
            )
        }
    }
}


