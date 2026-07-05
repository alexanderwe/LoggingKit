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
  "identifier" : "/documentation/LoggingKit/Combine/Publisher/logValue(logType:logCategory:functionName:fileName:lineNumber:_:)",
  "metadataVersion" : "0.1.0",
  "role" : "Instance Method",
  "symbol" : {
    "kind" : "Instance Method",
    "modules" : [
      "LoggingKit",
      "Combine"
    ],
    "preciseIdentifier" : "s:7Combine9PublisherP10LoggingKitE8logValue0E4Type0E8Category12functionName04fileJ010lineNumber_AA03AnyB0Vy6OutputQz7FailureQzGAD03LogG0O_s7KeyPathCyAD0Q10CategoriesVAD0qH0VGs12StaticStringVA0_SiypSgANctF"
  },
  "title" : "logValue(logType:logCategory:functionName:fileName:lineNumber:_:)"
}
-->

# logValue(logType:logCategory:functionName:fileName:lineNumber:_:)

Publisher which logs the ouput value of the preceding publisher

```
func logValue(logType: LogType = .verbose, logCategory: KeyPath<LogCategories, LogCategory> = \.default, functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: Int = #line, _ message: @escaping (Self.Output) -> Any? = { (output: Self.Output) in return output }) -> AnyPublisher<Self.Output, Self.Failure>
```

## Parameters

`logType`

Type of the value log message

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