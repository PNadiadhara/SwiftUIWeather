//
//  ContentView.swift
//  Weather-SwiftUI
//
//  Created by Pritesh Nadiadhara on 3/28/22.
//

import SwiftUI

struct ContentView: View {
  // State "saves" data while rest of struct is destroyed and recreated
  @State private var isNight = false
  
  var body: some View {
    
    ZStack {
      // $ shows that the variable is binding
      BackgroundView( isNight: $isNight)
      ScrollView {
        VStack {
          CityTextView(city: "Cupertino, CA")
          
          MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
          
          Spacer()
          WeekDayWeatherStatusView()
          
          
          
          
          Spacer()
          
          Button {
            isNight.toggle()
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
      // SFsymbols 3 updatelets you play with symbol colors
      Image(systemName: imageName)
        .symbolRenderingMode(.palette)
        .resizable()
        .foregroundStyle(.pink, .orange, .green)
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
  // Binding not neccesary here as the data doesnt get changed by this BackgroundView
  @Binding var isNight: Bool
  
  var body: some View {
    
    LinearGradient(gradient:
                    Gradient(colors: [ isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                   startPoint: .topLeading,
                   endPoint: .bottomTrailing)
      .ignoresSafeArea()
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

struct WeekDayWeatherStatusView: View {
  var body: some View {
    ZStack {
      WeekDayWeatherStatusViewBackground()
      
      ScrollView (.horizontal, showsIndicators: false) {
        HStack(spacing: 30) {
          ForEach(0..<10) {index in
            WeatherDayView(dayOfWeek: "ForEach",
                           imageName: "cloud.sun.fill",
                           temperature: 70)
          }
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
        .padding()
      }
    }
  }
}

struct WeekDayWeatherStatusViewBackground : View {
  var body: some View {
    Color(.secondarySystemBackground)
      .frame(height: 150)
      .cornerRadius(12)
      .padding(.horizontal)
      .opacity(0.3t)
  }
  
  
}
