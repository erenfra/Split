//
//  HeaderView.swift
//  Split
//
//  Created by Renato Oliveira Fraga on 12/19/22.
//

import SwiftUI

struct HeaderView: View {
    @ObservedObject var splitManager = SplitManager()
    @FocusState private var amountIsFocused: Bool
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("grad_top"), Color("grad_bottom")], startPoint: .top, endPoint: .bottom)
            VStack {
                Spacer()
                Image("table")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .padding(.vertical)
                TextField("Amout", value: $splitManager.checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .font(.title2)
                    .foregroundColor(.black)
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                    .frame(width: 220, height: 20)
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 50).foregroundColor(.white))
                    .shadow(radius: 1.0, x: 1.0, y: 1.0)
                HStack(spacing: 50) {
                    People()
                    HStack(spacing: 15) {
                        Button(action: {
                            splitManager.add()
                        }, label: {
                            RoundButton(sfsymb: "plus")
                        })
                        NumberPeople(value: splitManager.numberOfPeople)
                        Button(action: {
                            splitManager.dec()
                        }, label: {
                            RoundButton(sfsymb: "minus")
                        })
                    }
                    .padding()
                }
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .keyboard, content: {
                Button(action: {
                    amountIsFocused = false
                }, label: {
                    Text("Done")
                        
                })
            })
        })
        .frame(height: 370)
        .cornerRadius(50)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
