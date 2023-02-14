//
//  EventsExpectation.swift
//  SportsAppTests
//
//  Created by Michael Hany on 14/02/2023.
//

import Foundation
import XCTest
@testable import SportsApp

final class EventsExpectation: XCTestCase
{
    override func setUpWithError() throws
    {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFootballFetchEventsURL ()
    {
        let expect = expectation(description: "Wait the API")
        FetchUpcomingURL.fetchURL(completionHandler: {response in
            guard let data : UpComing = response else {
                XCTFail()
                expect.fulfill()
                return
            }
            XCTAssertNotEqual(data.result?.count, 0, "Football API Failed")
            expect.fulfill()
        }, sportType: "football", leagueID: 205)
        waitForExpectations(timeout: 5)
    }
    
    func testBaskettballFetchEventsURL ()
    {
        let expect = expectation(description: "Wait the API")
        FetchUpcomingURL.fetchURL(completionHandler: {response in
            guard let data : UpComing = response else {
                XCTFail()
                expect.fulfill()
                return
            }
            XCTAssertNotEqual(data.result?.count, 0, "Basketball API Failed")
            expect.fulfill()
        }, sportType: "basketball", leagueID: 205)
        waitForExpectations(timeout: 5)
    }
    
    func testCricketFetchEventsURL ()
    {
        let expect = expectation(description: "Wait the API")
        FetchUpcomingURL.fetchURL(completionHandler: {response in
            guard let data : UpComing = response else {
                XCTFail()
                expect.fulfill()
                return
            }
            XCTAssertNotEqual(data.result?.count, 0, "Cricket API Failed")
            expect.fulfill()
        }, sportType: "cricket", leagueID: 205)
        waitForExpectations(timeout: 5)
    }
    
    func testTennisFetchEventsURL ()
    {
        let expect = expectation(description: "Wait the API")
        FetchUpcomingURL.fetchURL(completionHandler: {response in
            guard let data : UpComing = response else {
                XCTFail()
                expect.fulfill()
                return
            }
            XCTAssertNotEqual(data.result?.count, 0, "Tennis API Failed")
            expect.fulfill()
        }, sportType: "tennis", leagueID: 205)
        waitForExpectations(timeout: 5)
    }
}
