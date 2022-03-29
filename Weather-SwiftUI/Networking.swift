//
//  Networking.swift
//  Weather-SwiftUI
//
//  Created by Pritesh Nadiadhara on 3/29/22.
//

import Foundation

func fetch() {
  guard let url = URL(string: "URL") else {
    return
  }
  let task = URLSession.shared.dataTask(with: url) { data, _,
    error in
    guard let data = data, error == nil else {
      return
    }

  }
}
