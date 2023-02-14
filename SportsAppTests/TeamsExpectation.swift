//
//  TeamsExpectation.swift
//  SportsAppTests
//
//  Created by Michael Hany on 14/02/2023.
//

import Foundation
import XCTest
@testable import SportsApp

final class TeamssExpectation: XCTestCase
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
        FetchTeamssData.fetchURLTeams(compeletionHandeler: {response in
            guard let data : TeamssResult = response else {
                XCTFail()
                expect.fulfill()
                return
            }
            XCTAssertNotEqual(data.result.count, 0, "Football API Failed")
            expect.fulfill()
        }, sportType: "football", leagueID: 205)
        waitForExpectations(timeout: 5)
    }
    
    func testBasketballFetchEventsURL ()
    {
        let expect = expectation(description: "Wait the API")
        FetchTeamssData.fetchURLTeams(compeletionHandeler: {response in
            guard let data : TeamssResult = response else {
                XCTFail()
                expect.fulfill()
                return
            }
            XCTAssertNotEqual(data.result.count, 0, "Basket API Failed")
            expect.fulfill()
        }, sportType: "basketball", leagueID: 927)
        waitForExpectations(timeout: 5)
    }
    
    func testCricketFetchEventsURL ()
    {
        let expect = expectation(description: "Wait the API")
        FetchTeamssData.fetchURLTeams(compeletionHandeler: {response in
            guard let data : TeamssResult = response else {
                XCTFail()
                expect.fulfill()
                return
            }
            XCTAssertNotEqual(data.result.count, 0, "Cricket API Failed")
            expect.fulfill()
        }, sportType: "cricket", leagueID: 8301)
        waitForExpectations(timeout: 5)
    }
}
