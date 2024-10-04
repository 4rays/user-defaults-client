import Dependencies
import DependenciesMacros
import Foundation

@DependencyClient
public struct UserDefaultsConfigClient: Sendable {
  public var defaults: @Sendable () async throws -> UserDefaults
}

extension DependencyValues {
  public var userDefaultsConfigClient: UserDefaultsConfigClient {
    get { self[UserDefaultsConfigClient.self] }
    set { self[UserDefaultsConfigClient.self] = newValue }
  }
}

extension UserDefaultsConfigClient: TestDependencyKey {
  public static let previewValue = standard

  public static let standard = Self(
    defaults: { .standard }
  )

  public static let testValue = Self()
}
