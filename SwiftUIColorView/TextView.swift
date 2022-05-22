//
//  TextView.swift
//  SwiftUIColorView
//
//  Created by Pavel Kuzovlev on 22.05.2022.
//

import SwiftUI

struct TextView: View {
    
    let value: Double
    
    var body: some View {
        Text("\(lround(value))")
            .frame(width: 35, alignment: .leading)
            .foregroundColor(.white)
        
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            TextView(value: 128)
        }
    }
}
