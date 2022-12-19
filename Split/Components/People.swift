//
//  People.swift
//  Split
//
//  Created by Renato Oliveira Fraga on 12/19/22.
//

import SwiftUI

struct People: View {
    var body: some View {
        Image(systemName: "person.3")
                     .font(.headline)
                     .frame(width: 50, height: 50)
                     .background(Color(.white))
                     .cornerRadius(50)
                     //.shadow(radius: 1.0, x: 1.0, y: 1.0)
    }
}

struct People_Previews: PreviewProvider {
    static var previews: some View {
        People()
    }
}
