//
//  ContentView.swift
//  WeSplit
//
//  Created by utsav singh on 5/22/25.
//

import SwiftUI

struct ContentView: View {
    @State private var checkamount = 0.0
    @State private var tipPercentage = 20
    @State private var numberOfPeople = 0
    @FocusState private var amountIsFocused: Bool
    
    
    
    
    var totalPerPerson: Double {
        
        // Calculate the total amount including tip
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkamount / 100 * tipSelection
        let grandTotal = checkamount + tipValue
        // Calculate the total per person
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    var totalAmount: Double {
        
        
        let tipSelection = Double(tipPercentage)
        let tipValue = checkamount / 100 * tipSelection
        let grandTotal = checkamount + tipValue
        
        return grandTotal
    }
        
    
    var body: some View {
        NavigationStack {
            
            
            Form {
                Section {
                    TextField("Amount", value: $checkamount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    
                }
                
                Section("How much tip do you want to leave?"){
                    
                    Picker   ("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0,format: .percent)
                        }
                        
                        
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section ("Check Amount") {
                    Text(totalAmount,format:
                            .currency(code:Locale.current.currency?.identifier ?? "USD"))
                }
                    
                    
                
                Section ("Amount per Person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency? .identifier ?? "USD"))
                    
                    
                    
                }
                
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }}}
        }
            
            
        
    }}

#Preview {
    ContentView()
}
