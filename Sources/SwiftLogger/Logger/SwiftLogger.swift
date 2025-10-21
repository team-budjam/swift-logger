//
//  SwiftLogger.swift
//  swift-logger
//
//  Created by 김민우 on 10/21/25.
//
import OSLog


// MARK: Logger
public struct SwiftLogger: Sendable {
    // MARK: core
    public let subsystem: String
    public let category: String
    private let logger: Logger
    
    private init(subsystem: String, category: String) {
        self.subsystem = subsystem
        self.category = category
        self.logger = Logger(subsystem: subsystem, category: category)
    }
    
    public init(_ system: String) {
        self.init(subsystem: system, category: "")
    }
    
    public func withCategory(_ newCategory: String) -> SwiftLogger {
        return SwiftLogger(subsystem: self.subsystem, category: newCategory)
    }
    
    
    // MARK: debug
    public func start(_ file: String = #file,
                      _ line: Int = #line,
                      _ routine: String = #function) {
        let fileName = URL(fileURLWithPath: file).lastPathComponent
        
        logger.debug("\(fileName):\(line) - \(routine) start")
    }
    
    public func end(_ description: String? = nil,
                    _ file: String = #file,
                    _ line: Int = #line,
                    _ routine: String = #function) {
        
        let fileName = URL(fileURLWithPath: file).lastPathComponent
        
        logger.debug("\(fileName):\(line) - \(routine) \(description ?? "ended")")
    }
    
    
    // MARK: info
    public func info(_ description: String,
                     _ file: String = #file,
                     _ line: Int = #line,
                     _ routine: String = #function) {
        let fileName = URL(fileURLWithPath: file).lastPathComponent
        
        logger.info("\(fileName):\(line) - \(routine) \n\(description)")
    }
    
    
    // MARK: error
    public func error(_ description: String,
                      _ file: String = #file,      // 추가: 파일 경로
                      _ line: Int = #line,        // 추가: 줄 번호
                      _ routine: String = #function) { // 기존 #function
        
        // #file은 전체 파일 경로를 반환하므로, 파일 이름만 추출하여 사용하면 더 깔끔합니다.
        let fileName = URL(fileURLWithPath: file).lastPathComponent
        
        logger.error("\(fileName):\(line) - \(routine) failure\n\(description)")
    }
    
    public func error(_ error: Error,
                 _ file: String = #file,      // 추가
                 _ line: Int = #line,        // 추가
                 _ routine: String = #function) { // 추가
        // 다른 failure 함수를 호출할 때 file, line, routine 정보를 그대로 전달합니다.
        self.error("\(error)", file, line, routine)
    }
    
}
