//
//  WeatherModel.swift
//  Weather-SwiftUI
//
//  Created by Pritesh Nadiadhara on 3/29/22.
//

import Foundation

struct WeatherData : Codable {
  var lat : Int
  var lon : Int
  var current : Current
  var hourly : Hourly
  var daily : Daily
}

struct Current : Codable {
  var temp : Int // looks to be in kelvin
  var weather : Weather
}

struct Weather : Codable {
  var main : String
  var description : String
}

struct Hourly : Codable {
  
}

struct Daily : Codable {
  
}
