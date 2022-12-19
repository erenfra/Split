//
//  RoundButton.swift
//  Split
//
//  Created by Renato Oliveira Fraga on 12/19/22.
//

import SwiftUI

struct RoundButton: View {
    var sfsymb: String
    var body: some View {
        Image(systemName: sfsymb)
             .font(.title3.bold())
             .foregroundColor(.black)
             .frame(width: 30, height: 30)
             .background(Color(.white))
             .cornerRadius(50)
             .shadow(radius: 1.0, x: 1.0, y: 1.0)
    }
}

struct RoundButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton(sfsymb: "plus")
    }
}
