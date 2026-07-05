<!--
{
  "availability" : [
    "iOS: 18.0.0 -",
    "iPadOS: 18.0.0 -",
    "macCatalyst: 18.0.0 -",
    "macOS: 15.0.0 -",
    "tvOS: 18.0.0 -",
    "visionOS: 2.0.0 -",
    "watchOS: 11.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "LoggingKit",
  "identifier" : "/documentation/LoggingKit/LogProvider/log(_:_:logCategory:fileName:functionName:lineNumber:)",
  "metadataVersion" : "0.1.0",
  "role" : "Instance Method",
  "symbol" : {
    "kind" : "Instance Method",
    "modules" : [
      "LoggingKit"
    ],
    "preciseIdentifier" : "s:10LoggingKit11LogProviderP3log__0E8Category8fileName08functionH010lineNumberyAA0C4TypeO_ypSgyXKs7KeyPathCyAA0C10CategoriesVAA0cF0VGs12StaticStringVATSitF"
  },
  "title" : "log(_:_:logCategory:fileName:functionName:lineNumber:)"
}
-->

# log(_:_:logCategory:fileName:functionName:lineNumber:)

Process the log message

```
func log(_ event: LogType, _ message: @autoclosure () -> Any?, logCategory: KeyPath<LogCategories, LogCategory>, fileName: StaticString, functionName: StaticString, lineNumber: Int)
```

## Parameters

`event`

Log type

`message`

Log message to process

`logCategory`

The category of the log message

`fileName`

File name where the log message is created

`functionName`

Name of the function in which the log message is created

`lineNumber`

Line number in the file in which the log message is created