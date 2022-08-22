//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by victor on 18/08/2022.
//

import SwiftUI


// Demo
// 1. Stacks (ZStack, VStack, HStack)
// 2.
//  @State,
//  @Binding,
//  @StateObject,
//  @ObservableObject,
//  @ObservedObject,
//  @EnvironmentObject


struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                // Color(.blue).edgesIgnoringSafeArea(.all) // To fill all the safe area
                
                /*
                 BackgroundView(
                 topColor:  isNight ? .black : .blue,
                 bottomColor: isNight ? .gray : Color ("lightblue"))
                 */
                BackgroundView (isNight: $isNight)
                
                
                /*
                 if (isNight) {
                 BackgroundView(topColor: .black, bottomColor: .gray)
                 
                 } else {
                 BackgroundView(topColor: .blue, bottomColor: Color("lightblue"))
                 }
                 */
                
                VStack {
                    
                    CityTextView (cityName: "Nairobi, KE")
                    
                    MainWeatherStatusView (imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temparature: 76)
                    
                    HStack (spacing: 20){
                        WeatherView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temparatute: 77)
                        WeatherView(dayOfWeek: "WED", imageName: "cloud.rain.fill", temparatute: 73)
                        
                        WeatherView(dayOfWeek: "THU", imageName: "cloud.sun.fill", temparatute: 77)
                        
                        WeatherView(dayOfWeek: "FRI", imageName: "sun.dust", temparatute: 77)
                        
                        WeatherView(dayOfWeek: "SAT", imageName: "sun.dust", temparatute: 77)
                    }
                    
                    Spacer()
                    
                    Button {
                        isNight.toggle()
                    } label: {
                        WeatherButton (title: "Change day time",
                                       textColor: .blue,
                                       backgroundColor: Color.white )
                    }
                    Spacer()
                }
            }
            .navigationBarTitle("Weather App")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading){
                    Button {
                        // print("Print stuff")
                        isNight.toggle()
                    } label: {
                        Label ("Save", systemImage: isNight ? "lightbulb": "lightbulb.fill")
                    }
                    
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

struct WeatherView: View {
    
    var dayOfWeek:  String
    var imageName:  String
    var temparatute:  Int
    
    var body: some View {
        
        VStack (spacing: 20) {
            
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40, alignment: .center)
                .foregroundColor(.white)
            
            Text("\(temparatute)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    //
    //    var topColor: Color
    //    var bottomColor: Color
    
    var body: some View {
        //LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
        
        LinearGradient(gradient: Gradient(colors: [isNight ?  .black : .blue, isNight ? .gray : Color ("lightblue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}


struct CityTextView : View {
    var cityName: String
    
    var body: some View {
        Text ("Nairobi, KE")
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
    
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temparature: Int
    
    var body: some View {
        
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180, alignment: .center)
            
            Text("\(temparature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}
