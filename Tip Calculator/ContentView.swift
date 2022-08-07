//
//  ContentView.swift
//  Tip Calculator
//
//  Created by Bryon Carlin on 8/3/22.
//
import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20
    @FocusState private var amountIsDone: Bool
    
    let tipPercentages = [0, 15, 18, 20, 25]
    
    var tipPerPerson: Double{
        let peopleCount = Double(numberOfPeople + 1)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let tipAmount =  tipValue / peopleCount
        
        return tipAmount
    }
    
    var grandtotalPerson: Double {
        
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        
        return grandTotal
    }
    
    var totalPerPerson: Double {
           let peopleCount = Double(numberOfPeople + 1)
           let tipSelection = Double(tipPercentage)
           
           let tipValue = checkAmount / 100 * tipSelection
           let grandTotal = checkAmount + tipValue
           let amountPerPerson = grandTotal / peopleCount
           
           return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form{
                Section {
                    TextField("Subtotal", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsDone)
                
                    
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(1..<100) {
                            Text("\($0)")
                        }
                        
                    }
                }
                
                Section {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Tip %")
                }
                Section{
                    Text(tipPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }header:{
                    Text("Total Tip Amount PER PERSON")
                }
                Section{
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }header:{
                    Text("Total Amount Per Person ")
                }
                Section{
                    Text(grandtotalPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }header:{
                    Text("Grand Total")
                }
            }
            
            
            
            .navigationTitle("Tip Calculator")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    Button("Done") {
                        amountIsDone = false
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
}
