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
      BackgroundView(gradientTop: Color.blue, gradientBottom: Color("lightBlue"))
      VStack {
        CityTextView(city: "Cupertino, CA")
        
        MainWeatherStatusView(imageName: "cloud.sun.fill", temperature: 76)
        
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
        
        Button {
          // action
          print("Pick location button tapped")
        } label : {
          //button asthetics
          WeatherButton(title: "Pick Location", textColor: .blue, backgroundColor: .white)
          
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

struct BackgroundView: View {
  
  var gradientTop: Color
  var gradientBottom : Color
  
  var body: some View {
    LinearGradient(gradient:
                    Gradient(colors: [gradientTop, gradientBottom]), startPoint: .topLeading,
                   endPoint: .bottomTrailing)
      .edgesIgnoringSafeArea(.all)
  }
}

struct CityTextView: View {
  var city : String
  var body: some View {
    Text(city)
      .font(.system(size: 32, weight: .medium, design: .default))
      .foregroundColor(.white)
      .padding()
  }
}

struct MainWeatherStatusView: View {
  
  var imageName: String
  var temperature: Int
  
  var body: some View {
    VStack (spacing: 10) {
      Image(systemName: imageName)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 180, height: 180, alignment: .center)
      Text(String("\(temperature)°"))
        .font(.system(size: 70,weight: .medium))
        .foregroundColor(.white)
    }
  }
}


