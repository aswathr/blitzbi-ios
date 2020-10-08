//
//  BlitzBiTests.swift
//  BlitzBiTests
//
//  Created by Admin on 08/10/20.
//

//import XCTest
//@testable import BlitzBi
//
//class BlitzBiTests: XCTestCase {
//
//    private var biService: BlitzBiService!
//
//    override func setUpWithError() throws {
//        biService = BlitzBiService.shared;
//        biService.setUp(appId: 3, appToken: "9fbc1e8c-4dd3-4fcf-9921-f28f58c5bf6a")
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        sendGenericClickEvent();
//        sendGenericClickEvents();
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        sendGenericClickEvent();
//        sendGenericClickEvents();
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        sendGenericClickEvent();
//        sendGenericClickEvents();
//        measure {
//            // Put the code you want to measure the time of here.
//            sendGenericClickEvent();
//            sendGenericClickEvents();
//        }
//    }
//
//    private func sendGenericClickEvent() -> Void {
//        biService.sendEvent(eventDict: getGenericClickEvent())
//    }
//
//    private func sendGenericClickEvents() -> Void {
//        biService.sendEvents(getGenericClickEvents())
//    }
//
//    private func getGenericClickEvent() -> [String : Any] {
//        var event: [String : Any] = [String : Any]()
//        event["eventName"] = "generic_click"
//        event["view_name"] = "app_start"
//        event["button_name"] = "app_start"
//        return event
//    }
//
//    private func getGenericClickEvents() -> [[String : Any]] {
//        var events: [[String : Any]] = [[String : Any]]()
//        events.append(getGenericClickEvent())
//        events.append(getGenericClickEvent())
//        events.append(getGenericClickEvent())
//        events.append(getGenericClickEvent())
//        events.append(getGenericClickEvent())
//        return events
//    }
//}
