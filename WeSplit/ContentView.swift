//
//  ContentView.swift
//  WeSplit
//
//  Created by Ben Atkinson on 11/04/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    let students = ["Harry","Hermione","Ron"]
    @State private var selectedStudent = "Harry"
    var body: some View {
        NavigationView{
            
            Form {
                Section{
                    Picker("Select your student", selection: $selectedStudent){
                        ForEach(students, id:\.self){
                            Text($0)
                        }
                    }
                }
                Section{
                    TextField("Enter your name", text: $name)
                    Text("Your name is \(name) and you selected \(selectedStudent)")
                }
                Section{
                    Button("Tap count is: \(tapCount)"){
                        tapCount += 1
                    }
                }
                Section{
                    Group{
                        Text("Hello world!")
                        Text ("This is my first app :)")
                        Text("Here's to many, many,more!")
                    }
                    
                }
                
            }.navigationTitle("My First App")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
