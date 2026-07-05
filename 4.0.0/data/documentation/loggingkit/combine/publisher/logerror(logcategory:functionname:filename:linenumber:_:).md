<!--
{
  "availability" : [
    "iOS: 13.0.0 -",
    "iPadOS: 13.0.0 -",
    "macCatalyst: 13.0.0 -",
    "macOS: 10.15.0 -",
    "tvOS: 13.0.0 -",
    "visionOS: 2.0 -",
    "watchOS: 6.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "LoggingKit",
  "identifier" : "/documentation/LoggingKit/Combine/Publisher/logError(logCategory:functionName:fileName:lineNumber:_:)",
  "metadataVersion" : "0.1.0",
  "role" : "Instance Method",
  "symbol" : {
    "kind" : "Instance Method",
    "modules" : [
      "LoggingKit",
      "Combine"
    ],
    "preciseIdentifier" : "s:7Combine9PublisherP10LoggingKitE8logError0E8Category12functionName04fileI010lineNumber_AA03AnyB0Vy6OutputQz7FailureQzGs7KeyPathCyAD13LogCategoriesVAD0rG0VG_s12StaticStringVAYSiypSgAOctF"
  },
  "title" : "logError(logCategory:functionName:fileName:lineNumber:_:)"
}
-->

# logError(logCategory:functionName:fileName:lineNumber:_:)

Publisher which logs the failure value of the preceding publisher

```
func logError(logCategory: KeyPath<LogCategories, LogCategory> = \.default, functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: Int = #line, _ message: @escaping (Self.Failure) -> Any? = { (output: Self.Failure) in return output }) -> AnyPublisher<Self.Output, Self.Failure>
```

## Parameters

`logCategory`

Category of the log message

`functionName`

Name of the function in which the message is logged

`fileName`

Name of the file in which the message is logged

`lineNumber`

Line number in which the message is logged

`message`

Message to log

## Return Value

Returns an AnyPublisher with `AnyPublisher<Self.Output, Self.Failure>`