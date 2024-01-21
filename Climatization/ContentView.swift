//
//  ContentView.swift
//  Climatization
//
//  Created by José Angel Prieto on 1/20/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    struct WeatherDay {
        let dayOfWeek: String
        let imageName: String
        let temperature: Int
    }

    let weatherDays: [WeatherDay] = [
        WeatherDay(dayOfWeek: "LUN", imageName: "cloud.sun.fill", temperature: 28),
        WeatherDay(dayOfWeek: "MAR", imageName: "sun.max.fill", temperature: 33),
        WeatherDay(dayOfWeek: "MIE", imageName: "wind.snow", temperature: 26),
        WeatherDay(dayOfWeek: "JUE", imageName: "sunset.fill", temperature: 25),
        WeatherDay(dayOfWeek: "VIE", imageName: "sun.max.fill", temperature: 32)
    ]
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Parnamirim BR")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                
                HStack (spacing: 20){
                    ForEach(weatherDays, id: \.dayOfWeek) { weatherDay in
                        WeatherDayView(dayOfWeek: weatherDay.dayOfWeek,
                                       imageName: weatherDay.imageName,
                                       temperature: weatherDay.temperature)
                    }
                }
               
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(text:"Cambiar Horario", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        HStack {
            VStack {
                Text(dayOfWeek)
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundStyle(.white)
                Image(systemName: imageName)
                    .symbolRenderingMode(.multicolor)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text("\(temperature)°")
                    .font(.system(size: 28, weight: .medium))
                    .foregroundColor(.white)
            }
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool

    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 28, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 50)
    }
}
