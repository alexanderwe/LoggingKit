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
  "identifier" : "/documentation/LoggingKit/LogService/warning(_:logCategory:fileName:functionName:lineNumber:)",
  "metadataVersion" : "0.1.0",
  "role" : "Type Method",
  "symbol" : {
    "kind" : "Type Method",
    "modules" : [
      "LoggingKit"
    ],
    "preciseIdentifier" : "s:10LoggingKit10LogServiceC7warning_11logCategory8fileName08functionI010lineNumberyypSgyXA_s7KeyPathCyAA0C10CategoriesVAA0cG0VGs12StaticStringVARSitFZ"
  },
  "title" : "warning(_:logCategory:fileName:functionName:lineNumber:)"
}
-->

# warning(_:logCategory:fileName:functionName:lineNumber:)

Create a warning type log message

```
static func warning(_ message: @escaping @autoclosure () -> Any?, logCategory: KeyPath<LogCategories, LogCategory> = \.default, fileName: StaticString = #file, functionName: StaticString = #function, lineNumber: Int = #line)
```

## Parameters

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