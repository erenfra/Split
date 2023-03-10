//
//  NumberPeopleView.swift
//  Split
//
//  Created by Renato Oliveira Fraga on 12/19/22.
//

import SwiftUI

struct NumberPeople: View {
    var value: Int
    
    var body: some View {
        Text(String(value))
             .font(.title.bold())
             .foregroundColor(.black)
             .frame(width: 50, height: 50)
             .background(Color(.white))
             .cornerRadius(13)
     
    }
}

struct NumberPeopleView_Previews: PreviewProvider {
    static var previews: some View {
        NumberPeople(value: 2)
    }
}
