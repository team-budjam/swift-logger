//
//  Debuggable.swift
//  swift-logger
//
//  Created by 김민우 on 10/21/25.
//
import Foundation


// MARK: ObjectDebuggable
@MainActor
public protocol ObjectDebuggable: AnyObject, Sendable {
    var issue: (any IssueRepresentable)? { get set }
    var callback: Callback? { get set }
}

public typealias Callback = @Sendable @MainActor () -> Void


// MARK: ObjectDebuggable Extension
@MainActor
public extension ObjectDebuggable {
    var isIssueOccurred: Bool { self.issue != nil }
    
    func setIssue<E: RawRepresentable<String>>(_ error: E) {
        self.issue = KnownIssue(error)
    }
    
    func setUnknownIssue(_ error: Error, location: String = #function) {
        self.issue = UnknownIssue(error)
    }
}

@MainActor
public extension ObjectDebuggable {
    func setCallbackNil() {
        self.callback = nil
    }
}
