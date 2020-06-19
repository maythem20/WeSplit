//
//  ContentView.swift
//  WeSplit
//
//  Created by Maythem Alsodani on 6/17/20.
//  Copyright © 2020 Maythem Alsodani. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkamount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 0
    @State private var TotalAmount = 0.0
     let tipPercentages = [10,15,20,25,0]
    
    
    var totalPerPerson: Double {
    let peopleCount = Double(numberOfPeople) ?? 1
    let theTipPercentage = Double(tipPercentages[tipPercentage])
    let TotalAmount = Double(checkamount) ?? 0
    let TotalAmountPlusTip = TotalAmount * ((theTipPercentage/100) + 1)
    let amountPerPerson = TotalAmountPlusTip / peopleCount
        
        return amountPerPerson
    }
    
    var TotalAmountIncludeTip: Double {
        _ = Double(numberOfPeople) ?? 1
        let theTipPercentage = Double(tipPercentages[tipPercentage])
        let TotalAmount = Double(checkamount) ?? 0
        let TotalAmountPlusTip = TotalAmount * ((theTipPercentage/100) + 1)
        
        return TotalAmountPlusTip
    }
        
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter Total Amount", text: $checkamount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number of People", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                    }
                
                Section(header: Text("Tip Percentage")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Amount Per Person Including Tip")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                Section(header: Text("Grand Total Amount Including Tip")) {
                    Text("$\(TotalAmountIncludeTip, specifier:"%.2f")")
                    
                }
            }
        .navigationBarTitle("WeSplit")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
