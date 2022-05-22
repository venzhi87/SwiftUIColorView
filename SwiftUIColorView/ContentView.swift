//
//  ContentView.swift
//  SwiftUIColorView
//
//  Created by Pavel Kuzovlev on 17.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State var red = Double.random(in: 0...255)
    @State var green = Double.random(in: 0...255)
    @State var blue = Double.random(in: 0...255)
    
    @FocusState private var isInputActive: Bool
    
 
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.431037277, green: 0.5859485865, blue: 1, alpha: 1))
                .ignoresSafeArea()
                .onTapGesture {
                    isInputActive = false
                }
                 
            VStack(spacing: 40) {
                ColorView(red: red, green: green, blue: blue)
                
                VStack {
                    ColorSliderView(value: $red, color: .red)
                    ColorSliderView(value: $green, color: .green)
                    ColorSliderView(value: $blue, color: .blue)
                }
                .frame(height: 150)
                .focused($isInputActive)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            isInputActive = false
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
