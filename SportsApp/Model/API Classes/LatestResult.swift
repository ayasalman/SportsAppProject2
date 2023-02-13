//
//  LatestResult.swift
//  SportsApp
//
//  Created by Aya on 11/02/2023.
//

import Foundation
class LatestResults : Decodable
{
    var success : Int?
    var result : [LatestEvents]
}
