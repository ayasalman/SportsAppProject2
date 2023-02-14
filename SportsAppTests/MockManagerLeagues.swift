//
//  MockManagerLeagues.swift
//  SportsAppTests
//
//  Created by Michael Hany on 14/02/2023.
//

import Foundation
@testable import SportsApp

class MockManagerLeagues
{
    let mockManager : String = "{\"success\":1,\"result\":[{\"league_key\":4,\"league_name\":\"UEFA Europa League\",\"country_key\":1,\"country_name\":\"eurocups\",\"league_logo\":\"https:\\/\\/apiv2.allsportsapi.com\\/logo\\/logo_leagues\\/\",\"country_logo\":null}]}"
    
}

extension MockManagerLeagues
{
    func loadDataFromURL(givenUrl url: String, completionHandler: @escaping ([League]?) -> Void)
    {
        let data = Data(mockManager.utf8)
        do
        {
            let response = try JSONDecoder().decode(MyResult.self, from: data)
            completionHandler(response.result)
        }
        catch
        {
            completionHandler(nil)
        }
    }
}
