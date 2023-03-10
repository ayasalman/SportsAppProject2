//
//  SportsAppTests.swift
//  SportsAppTests
//
//  Created by Aya on 01/02/2023.
//

import XCTest
@testable import SportsApp

final class SportsAppTests: XCTestCase
{
    
    override func setUpWithError() throws
    {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFootballFetchLeagueURL ()
    {
        let expect = expectation(description: "Wait the API")
        fetchLeagueURL.fetchURL(completionHandler: { response in
            guard let data : MyResult = response else {
                XCTFail()
                expect.fulfill()
                return
            }
            XCTAssertNotEqual(data.result.count, 0, "Football API Failed")
            expect.fulfill()
        }, sportType: "football")
        waitForExpectations(timeout: 5)
    }
    
    func testBaskettballFetchLeagueURL ()
    {
        let expect = expectation(description: "Wait the API")
        fetchLeagueURL.fetchURL(completionHandler: { response in
            guard let data : MyResult = response else {
                XCTFail()
                expect.fulfill()
                return
            }
            XCTAssertNotEqual(data.result.count, 0, "Basketball API Failed")
            expect.fulfill()
        }, sportType: "basketball")
        waitForExpectations(timeout: 5)
    }
    
    func testCricketFetchLeagueURL ()
    {
        let expect = expectation(description: "Wait the API")
        fetchLeagueURL.fetchURL(completionHandler: { response in
            guard let data : MyResult = response else {
                XCTFail()
                expect.fulfill()
                return
            }
            XCTAssertNotEqual(data.result.count, 0, "Cricket API Failed")
            expect.fulfill()
        }, sportType: "cricket")
        waitForExpectations(timeout: 5)
    }
    
    func testTennisFetchLeagueURL ()
    {
        let expect = expectation(description: "Wait the API")
        fetchLeagueURL.fetchURL(completionHandler: { response in
            guard let data : MyResult = response else {
                XCTFail()
                expect.fulfill()
                return
            }
            XCTAssertNotEqual(data.result.count, 0, "Tennis API Failed")
            expect.fulfill()
        }, sportType: "tennis")
        waitForExpectations(timeout: 5)
    }
}
