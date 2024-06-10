//
//  Coordinatable.swift
//  DiWall
//
//  Created by Laura Belen Yachelini on 06/06/2024.
//

import SwiftUI

protocol Coordinatable: AnyObject {
    associatedtype Root: View
    associatedtype Page: View
    var path: [Route] { get set }
    func routeTo(_ route: Route, style: PresentationStyle)
    func getDestination(for: Route) -> Page
    func rootView() -> Root
    func root(_ root: Route)
}
