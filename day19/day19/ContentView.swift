//
//  ContentView.swift
//  day19
//
//  Created by Ilgın Akgöz on 15.02.2022.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var amountIsFocused: Bool
    @State private var inputNumber = 0.0
    @State private var inputUnit = "Celcius"
    @State private var outputUnit = "Fahrenheit"
    
    let units = ["Celcius", "Fahrenheit", "Kelvin"]
    
    // convert user input to Celcius
    var baseUnitConversion: Double {
        if inputUnit == "Fahrenheit" {
            let fahrenheitToCelcius = (inputNumber - 32) * 5 / 9
            
            return fahrenheitToCelcius
        } else if inputUnit == "Kelvin" {
            let kelvinToCelcius = inputNumber - 273.15
            
            return kelvinToCelcius
        } else {
            return inputNumber
        }
        
    }
    
    // convert to desired output unit
    var conversion: Double {
        if outputUnit == "Fahrenheit" {
            let celciusToFahrenheit = (baseUnitConversion * 9 / 5) + 32
            
            return celciusToFahrenheit
        } else if outputUnit == "Kelvin" {
            let celciusToKelvin = baseUnitConversion + 273.15
            
            return celciusToKelvin
        } else {
            return baseUnitConversion
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Your input: ", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                        
                }
                Section {
                    Text(conversion, format: .number)
                    
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                } header: {
                    Text("Conversıon")
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
