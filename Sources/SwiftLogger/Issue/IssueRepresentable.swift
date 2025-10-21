//
//  IssueRepresentable.swift
//  swift-logger
//
//  Created by 김민우 on 10/21/25.
//
import Foundation


// MARK: IssueRepresentable
public protocol IssueRepresentable: Swift.Error, Hashable, Sendable, Identifiable {
    var id: UUID { get }
    var isKnown: Bool { get }
    var reason: String { get }
}


public extension IssueRepresentable {
    var localizedDescription: String {
        self.reason
    }
}
