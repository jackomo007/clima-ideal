//
//  WeatherButton.swift
//  Climatization
//
//  Created by José Angel Prieto on 1/21/24.
//
import SwiftUI

struct WeatherButton: View {
    var text: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(text)
            .frame(width:280, height: 50)
            .foregroundColor(textColor)
            .background(backgroundColor.gradient)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}


