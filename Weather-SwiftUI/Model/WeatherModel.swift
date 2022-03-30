//
//  WeatherModel.swift
//  Weather-SwiftUI
//
//  Created by Pritesh Nadiadhara on 3/29/22.
//

import Foundation

struct WeatherData : Codable {
  var lat : Double
  var lon : Double
  var current : Current
  var hourly : Hourly
  var daily : Daily
}

struct Current : Codable {
  var temp : Double // looks to be in kelvin
  var sunrise : Int // all time given in Unix, UTC format
  var sunset : Int
  var weather : Weather
}

struct Weather : Codable {
  var main : String
  var description : String
}

struct Hourly : Codable {
  var dt : Double
  var temp : Double
}

struct Daily : Codable {
  var temp : Temp
  var weather : Weather
}

struct Temp : Codable {
  var min : Double
  var max : Double
}
