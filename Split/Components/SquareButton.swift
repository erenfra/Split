//
//  SquareButton.swift
//  Split
//
//  Created by Renato Oliveira Fraga on 12/19/22.
//

import SwiftUI

struct SquareButton: View {
    var title: String
    var selected: Bool
    var body: some View {
        Text(title)
             .font(.title3)
             .foregroundColor(.black)
             .frame(width: 50, height: 50)
             .background(Color(selected ? "selected" : "notSelected"))
             .cornerRadius(10)
             .shadow(radius: 1.0, x: 1.0, y: 1.0)
    }
}

struct SquareButton_Previews: PreviewProvider {
    static var previews: some View {
        SquareButton(title: "10%", selected: true)
    }
}
