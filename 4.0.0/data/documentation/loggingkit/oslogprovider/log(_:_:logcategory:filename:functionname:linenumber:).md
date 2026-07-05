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
  "identifier" : "/documentation/LoggingKit/OSLogProvider/log(_:_:logCategory:fileName:functionName:lineNumber:)",
  "metadataVersion" : "0.1.0",
  "role" : "Instance Method",
  "symbol" : {
    "kind" : "Instance Method",
    "modules" : [
      "LoggingKit"
    ],
    "preciseIdentifier" : "s:10LoggingKit13OSLogProviderV3log__0E8Category8fileName08functionH010lineNumberyAA7LogTypeO_ypSgyXKs7KeyPathCyAA0L10CategoriesVAA0lF0VGs12StaticStringVATSitF"
  },
  "title" : "log(_:_:logCategory:fileName:functionName:lineNumber:)"
}
-->

# log(_:_:logCategory:fileName:functionName:lineNumber:)

```
func log(_ event: LogType, _ message: @autoclosure () -> Any?, logCategory: KeyPath<LogCategories, LogCategory>, fileName: StaticString = #file, functionName: StaticString = #function, lineNumber: Int = #line)
```