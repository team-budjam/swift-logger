//
//  UnknownIssue.swift
//  swift-logger
//
//  Created by 김민우 on 10/21/25.
//
import Foundation


// MARK: UnknownIssue
public struct UnknownIssue: IssueRepresentable {
    public let id = UUID()
    public let isKnown: Bool = false
    public let reason: String
    
    public init(reason: String) {
        self.reason = reason
    }
    
    public init<ObjectError: Error>(_ reason: ObjectError) {
        self.reason = reason.localizedDescription
    }
}
