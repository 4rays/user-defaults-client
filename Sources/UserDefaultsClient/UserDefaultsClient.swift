import Dependencies
import DependenciesMacros
import Foundation

@DependencyClient
public struct UserDefaultsClient: Sendable {
  public var string: @Sendable (UserDefaultsKey) async throws -> String?
  public var setString: @Sendable (_ key: UserDefaultsKey, String) async throws -> Void

  public var int: @Sendable (UserDefaultsKey) async throws -> Int?
  public var setInt: @Sendable (_ key: UserDefaultsKey, Int) async throws -> Void

  public var bool: @Sendable (UserDefaultsKey) async throws -> Bool?
  public var setBool: @Sendable (_ key: UserDefaultsKey, Bool) async throws -> Void

  public var double: @Sendable (UserDefaultsKey) async throws -> Double?
  public var setDouble: @Sendable (_ key: UserDefaultsKey, Double) async throws -> Void

  public var array: @Sendable (UserDefaultsKey) async throws -> [Any]?
  public var setArray: @Sendable (_ key: UserDefaultsKey, [Any]) async throws -> Void

  public var data: @Sendable (UserDefaultsKey) async throws -> Data?
  public var setData: @Sendable (_ key: UserDefaultsKey, Data) async throws -> Void

  public var date: @Sendable (UserDefaultsKey) async throws -> Date?
  public var setDate: @Sendable (_ key: UserDefaultsKey, Date) async throws -> Void

  public var dictionary: @Sendable (UserDefaultsKey) async throws -> [String: Any]?
  public var setDictionary: @Sendable (_ key: UserDefaultsKey, [String: Any]) async throws -> Void
}

extension DependencyValues {
  public var userDefaultsClient: UserDefaultsClient {
    get { self[UserDefaultsClient.self] }
    set { self[UserDefaultsClient.self] = newValue }
  }
}

extension UserDefaultsClient: TestDependencyKey {
  public static let previewValue = Self { _ in
    "preview"
  } setString: { _, _ in
  } int: { _ in
    42
  } setInt: { _, _ in
  } bool: { _ in
    true
  } setBool: { _, _ in
  } double: { _ in
    3.14
  } setDouble: { _, _ in
  } array: { _ in
    [1, 2, 3]
  } setArray: { _, _ in
  } data: { _ in
    Data()
  } setData: { _, _ in
  } date: { _ in
    Date()
  } setDate: { _, _ in
  } dictionary: { _ in
    ["key": "value"]
  } setDictionary: { _, _ in
  }

  public static let testValue = Self()
}

extension UserDefaultsClient: DependencyKey {
  public static let liveValue = { () -> Self in
    @Dependency(\.userDefaultsConfigClient) var config

    return Self(
      string: { key in
        try await config.defaults().string(forKey: key.value)
      },
      setString: { key, value in
        try await config.defaults().set(value, forKey: key.value)
      },
      int: { key in
        try await config.defaults().integer(forKey: key.value)
      },
      setInt: { key, value in
        try await config.defaults().set(value, forKey: key.value)
      },
      bool: { key in
        try await config.defaults().bool(forKey: key.value)
      },
      setBool: { key, value in
        try await config.defaults().set(value, forKey: key.value)
      },
      double: { key in
        try await config.defaults().double(forKey: key.value)
      },
      setDouble: { key, value in
        try await config.defaults().set(value, forKey: key.value)
      },
      array: { key in
        try await config.defaults().array(forKey: key.value)
      },
      setArray: { key, value in
        try await config.defaults().set(value, forKey: key.value)
      },
      data: { key in
        try await config.defaults().data(forKey: key.value)
      },
      setData: { key, value in
        try await config.defaults().set(value, forKey: key.value)
      },
      date: { key in
        try await config.defaults().object(forKey: key.value) as? Date
      },
      setDate: { key, value in
        try await config.defaults().set(value, forKey: key.value)
      },
      dictionary: { key in
        try await config.defaults().dictionary(forKey: key.value)
      },
      setDictionary: { key, value in
        try await config.defaults().set(value, forKey: key.value)
      }
    )
  }()
}
