# swift-logger

`swift-logger`는 간단한 로그 인터페이스를 제공하는 Swift 패키지입니다. 아래 단계에 따라 Swift Package Manager(SPM)에 통합하고 사용하는 방법을 설명합니다.

## SPM에 패키지 추가하기
1. Xcode 메뉴에서 **File > Add Packages...** 를 선택합니다.
2. 검색 창에 저장소 URL을 입력합니다.
   ```
   https://github.com/USER/swift-logger.git
   ```
3. 원하는 버전 규칙을 선택한 뒤 **Add Package**를 클릭합니다.
4. 로그 기능을 사용하려는 대상(Target)에 `swift-logger` 패키지를 추가합니다.

또는 `Package.swift` 파일을 직접 수정하여 패키지를 추가할 수 있습니다.
```swift
// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "YourApp",
    dependencies: [
        .package(url: "https://github.com/USER/swift-logger.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "YourApp",
            dependencies: [
                .product(name: "SwiftLogger", package: "swift-logger")
            ]
        )
    ]
)
```

## 사용법
패키지를 프로젝트에 추가한 이후에는 `SwiftLogger` 모듈을 임포트하여 사용할 수 있습니다.
```swift
import SwiftLogger

let logger = Logger()
logger.info("앱이 시작되었습니다.")
logger.debug("디버깅 메시지")
logger.error("오류가 발생했습니다", metadata: ["code": 500])
```

`Logger`는 `info`, `debug`, `error` 등의 메서드를 통해 다양한 로그 레벨을 지원하며, 필요에 따라 메타데이터를 함께 기록할 수 있습니다.

## 라이선스
이 프로젝트는 MIT 라이선스를 따릅니다. 자세한 내용은 [LICENSE](LICENSE) 파일을 참고하세요.
