import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
	[
		testCase(AlphaVantageTests.allTests),
	]
}
#endif
