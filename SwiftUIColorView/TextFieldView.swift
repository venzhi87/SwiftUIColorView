//
//  TextField.swift
//  SwiftUIColorView
//
//  Created by Pavel Kuzovlev on 22.05.2022.
//

import SwiftUI


struct TextFieldView: View {
    
    @Binding var text: String
    @Binding var value: Double
    
    @State private var showAlert = false
    
    var body: some View {
        TextField("", text: $text) { _ in
            checkValue()
        }
        .frame(width: 55, alignment: .trailing)
        .multilineTextAlignment(.trailing)
        .textFieldStyle(.roundedBorder)
        .keyboardType(.decimalPad)
        .alert("Wrong Format", isPresented: $showAlert, actions: {}) {
            Text("Please enter value from 0 to 255")
        }
    }
}

extension TextFieldView {
    private func checkValue() {
        if let value = Int(text), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        showAlert.toggle()
        value = 0
        text = "0"
    }
}

struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            TextFieldView(text: .constant("128"), value: .constant(128.0))
        }
    }
}

