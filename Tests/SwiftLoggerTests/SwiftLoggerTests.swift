//
//  SwiftLogger.swift
//  swift-logger
//
//  Created by 김민우 on 10/21/25.
//
import Testing
import SwiftLogger


// MARK: Tests
@Suite("SwiftLogger", .timeLimit(.minutes(1)))
struct SwiftLoggerTests {
    let logger = SwiftLogger("TEST")
    
    @Test func debug_start() {
        // when
        logger.start()
    }

    @Test func debug_end() {
        // when
        logger.end()
    }
    
    @Test func info() {
        // when
        logger.info("SOME_INFORMATION")
    }
    
    @Test func error() {
        // when
        logger.error("SOME_ERROR")
    }
}

