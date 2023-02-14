//
//  MockLeagueTest.swift
//  SportsAppTests
//
//  Created by Michael Hany on 14/02/2023.
//

import Foundation
@testable import SportsApp
import XCTest

class MockLeagueTest : XCTestCase
{
    
    var mockLeague : MockManagerLeagues?
    
    override func setUpWithError() throws
    {
        mockLeague = MockManagerLeagues()
    }

    override func tearDownWithError() throws
    {
        mockLeague = nil
    }
    
    func testMockFootballLeague ()
    {
        mockLeague?.loadDataFromURL(givenUrl: "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=6b6ba61102364e18a3ebf5edcfcfc27406736e877f8fe6a68f73e6506117ee02", completionHandler: { data in
            fetchLeagueURL.fetchURL(completionHandler: { response in
                guard let data : MyResult = response else {
                    XCTFail()
                    return
                }
                XCTAssertNotEqual(data.result.count, 0, "Football API Failed")
            }, sportType: "football")
        })
    }
    
    func testMockBaskettballLeague ()
    {
        mockLeague?.loadDataFromURL(givenUrl: "https://apiv2.allsportsapi.com/basketball/?met=Leagues&APIkey=6b6ba61102364e18a3ebf5edcfcfc27406736e877f8fe6a68f73e6506117ee02", completionHandler: { data in
            fetchLeagueURL.fetchURL(completionHandler: { response in
                guard let data : MyResult = response else {
                    XCTFail()
                    return
                }
                XCTAssertNotEqual(data.result.count, 0, "Basketball API Failed")
            }, sportType: "basketball")
        })
    }
    
    func testMockCricketLeague ()
    {
        mockLeague?.loadDataFromURL(givenUrl: "https://apiv2.allsportsapi.com/cricket/?met=Leagues&APIkey=6b6ba61102364e18a3ebf5edcfcfc27406736e877f8fe6a68f73e6506117ee02", completionHandler: { data in
            fetchLeagueURL.fetchURL(completionHandler: { response in
                guard let data : MyResult = response else {
                    XCTFail()
                    return
                }
                XCTAssertNotEqual(data.result.count, 0, "Cricket API Failed")
            }, sportType: "cricket")
        })
    }
    
    func testMockTennisLeague ()
    {
        mockLeague?.loadDataFromURL(givenUrl: "https://apiv2.allsportsapi.com/tennis/?met=Leagues&APIkey=6b6ba61102364e18a3ebf5edcfcfc27406736e877f8fe6a68f73e6506117ee02", completionHandler: { data in
            fetchLeagueURL.fetchURL(completionHandler: { response in
                guard let data : MyResult = response else {
                    XCTFail()
                    return
                }
                XCTAssertNotEqual(data.result.count, 0, "Tennis API Failed")
            }, sportType: "tennis")
        })
    }
}
