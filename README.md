# UserDefaultsClient

A dependency client that handles saving to and reading from UserDefaults in apps using the Swift Composable Architecture (TCA).

## Usage

You need to implement a live value of `UserDefaultsConfigClient` in order to use it in your app.

```swift
extension UserDefaultsConfigClient: DependencyValue {
  static let liveValue = Self {
    .standard
  }
}
```
