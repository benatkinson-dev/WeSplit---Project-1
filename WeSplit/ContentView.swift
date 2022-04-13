//
//  ContentView.swift
//  WeSplit
//
//  Created by Ben Atkinson on 11/04/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 10
    @FocusState private var amountIsFocused: Bool
    
    var totalPerPerson: Double{
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let totalAmount = grandTotal / peopleCount
        return totalAmount
    }
    
    let tipPercentages = [5,10,15,20,0]
    
    var body: some View {
        NavigationView{
            
            Form {
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "GBP"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                } header: {
                    Text("Bill amount and how many people?")
                }
                
                Section{
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                        Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section{
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "GBP"))
                } header: {
                    Text("Total per person")
                }
            }
            .navigationTitle("WeSplit app")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
