//
//  Networking.swift
//  Weather-SwiftUI
//
//  Created by Pritesh Nadiadhara on 3/29/22.
//

import Foundation

func fetchWeatherData() {
  guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}&exclude={part}&appid={API key}") else {
    return
  }
  let task = URLSession.shared.dataTask(with: url) { data, _,
    error in
    guard let data = data, error == nil else {
      return
    }

  }
}
