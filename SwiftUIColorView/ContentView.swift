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
    
    @FocusState private var focusedField: Field?
    
 
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.431037277, green: 0.5859485865, blue: 1, alpha: 1))
                .ignoresSafeArea()
                .onTapGesture {
                    focusedField = nil
                }
                 
            VStack(spacing: 40) {
                ColorView(red: red, green: green, blue: blue)
                
                VStack {
                    ColorSliderView(value: $red, color: .red)
                        .focused($focusedField, equals: .red)
                    ColorSliderView(value: $green, color: .green)
                        .focused($focusedField, equals: .green)
                    ColorSliderView(value: $blue, color: .blue)
                        .focused($focusedField, equals: .blue)
                }
                .frame(height: 150)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button(action: previousField) {
                            Image(systemName: "chevron.up")
                        }
                        Button(action: nextField) {
                            Image(systemName: "chevron.down")
                        }
                        Spacer()
                        Button("Done") {
                            focusedField = nil
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

extension ContentView {
    private enum Field {
        case red
        case green
        case blue
    }
    
    private func nextField() {
        switch focusedField {
        case .red:
            focusedField = .green
        case .green:
            focusedField = .blue
        case .blue:
            focusedField = .red
        case .none:
            focusedField = nil
        }
    }
    private func previousField() {
        switch focusedField {
        case .red:
            focusedField = .blue
        case .green:
            focusedField = .red
        case .blue:
            focusedField = .green
        case .none:
            focusedField = nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
