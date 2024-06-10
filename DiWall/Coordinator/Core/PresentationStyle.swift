//
//  PresentationStyle.swift
//  DiWall
//
//  Created by Laura Belen Yachelini on 06/06/2024.
//

public enum PresentationStyle: String, Identifiable {
    case push
    case present

    public var id: String {
        self.rawValue
    }
}
