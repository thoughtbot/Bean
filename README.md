# Bean [![CircleCI](https://circleci.com/gh/thoughtbot/Bean.svg?style=svg)](https://circleci.com/gh/thoughtbot/Bean) [![SwiftPM compatible](https://img.shields.io/badge/SwiftPM-compatible-brightgreen.svg)](https://swift.org/package-manager/)

A library that simplifies the way you deal with documents

## Requirements
- iOS 13.0 or later
- Swift 4.0 or later

## Supported Files
- Image
- Video
- Audio
- Text

## Installation

### [SwiftPM]

[SwiftPM]: https://github.com/apple/swift-package-manager

In Xcode: File > Swift Packages > Add Package Dependency
Paste: https://github.com/thoughtbot/Bean.git

## Usage

A Bean is a subclass of UIDocument that is returned after documents are selected

### Conforming to DocumentPickable
```swift
class ViewController: UIViewController, DocumentPickable {
```

### Present document picker
```swift
self.pickDocuments()
```

### Respond to protocal method
```swift
func didPickDocument(document: Bean?) {
    // handle the bean
}
```

### Preview a bean
```swift
self.presentPreview(document: Bean)
```
## License

Bean is Copyright © 2020 Abe Mangona and thoughtbot. It is free
software, and may be redistributed under the terms specified in the
[LICENSE](/LICENSE) file.

### About thoughtbot

![thoughtbot](https://presskit.thoughtbot.com/images/thoughtbot-logo-for-readmes.svg)

Bean is maintained and funded by thoughtbot, inc.
The names and logos for thoughtbot are trademarks of thoughtbot, inc.

We love open source software!
See [our other projects][community] or
[hire us][hire] to design, develop, and grow your product.

[community]: https://thoughtbot.com/community?utm_source=github
[hire]: https://thoughtbot.com/hire-us?utm_source=github
