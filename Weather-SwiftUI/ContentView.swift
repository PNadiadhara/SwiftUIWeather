//
//  ContentView.swift
//  Weather-SwiftUI
//
//  Created by Pritesh Nadiadhara on 3/28/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      ZStack {
        LinearGradient(gradient:
                        Gradient(colors: [.blue, Color("lightBlue")]), startPoint: .topLeading,
                            endPoint: .bottomTrailing)
          .edgesIgnoringSafeArea(.all)
        VStack {
          Text("Cupertino, CA")
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
          VStack (spacing: 10) {
            Image(systemName: "cloud.sun.fill")
              .renderingMode(.original)
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 180, height: 180, alignment: .center)
            Text("76°")
              .font(.system(size: 70,weight: .medium))
              .foregroundColor(.white)
          }
          Spacer()
          
          HStack(spacing: 30) {
            WeatherDayView(dayOfWeek: "TUE",
                           imageName: "cloud.sun.fill",
                           temperature: 70)
            WeatherDayView(dayOfWeek: "WED",
                           imageName: "sun.max.fill",
                           temperature: 76)
            WeatherDayView(dayOfWeek: "THU",
                           imageName: "wind.snow",
                           temperature: 55)
            WeatherDayView(dayOfWeek: "FRI",
                           imageName: "sunset.fill",
                           temperature: 60)
            WeatherDayView(dayOfWeek: "SAT",
                           imageName: "cloud.rain.fill",
                           temperature: 25)
          }
          
          Spacer()
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
  
  var dayOfWeek : String
  var imageName: String
  var temperature: Int
  
  var body: some View {
    VStack {
      Text(dayOfWeek)
        .font(.system(size: 16, weight: .medium, design: .default))
        .foregroundColor(.white)
      Image(systemName: imageName)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 40, height: 40)
        .foregroundColor(.white)
      Text("\(temperature)")
        .font(.system(size: 28,weight: .medium))
        .foregroundColor(.white)
    }
  }
}
