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
  "identifier" : "/documentation/LoggingKit/Combine/Publisher/log(messageValue:messageError:valuelogType:logCategory:functionName:fileName:lineNumber:)",
  "metadataVersion" : "0.1.0",
  "role" : "Instance Method",
  "symbol" : {
    "kind" : "Instance Method",
    "modules" : [
      "LoggingKit",
      "Combine"
    ],
    "preciseIdentifier" : "s:7Combine9PublisherP10LoggingKitE3log12messageValue0F5Error12valuelogType0E8Category12functionName04fileM010lineNumberAA03AnyB0Vy6OutputQz7FailureQzGypSgAPc_AtRcAD03LogJ0Os7KeyPathCyAD0T10CategoriesVAD0tK0VGs12StaticStringVA3_SitF"
  },
  "title" : "log(messageValue:messageError:valuelogType:logCategory:functionName:fileName:lineNumber:)"
}
-->

# log(messageValue:messageError:valuelogType:logCategory:functionName:fileName:lineNumber:)

Publisher which both logs the Self.Failure value and the Self.Output value of the preceding publisher

```
func log(messageValue: @escaping (Self.Output) -> Any? = { (output: Self.Output) in return output }, messageError: @escaping (Self.Failure) -> Any? = { (output: Self.Failure) in return output }, valuelogType: LogType = .verbose, logCategory: KeyPath<LogCategories, LogCategory> = \.default, functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: Int = #line) -> AnyPublisher<Self.Output, Self.Failure>
```

## Parameters

`messageValue`

Self.Output message to log

`messageError`

Self.Failure message to log

`valuelogType`

Type of the Self.Output log message

`logCategory`

Category of the both log messages

`functionName`

Name of the function in which the message is logged

`fileName`

Name of the file in which the message is logged

`lineNumber`

Line number in which the message is logged

## Return Value

Returns an AnyPublisher with `AnyPublisher<Self.Output, Self.Failure>`