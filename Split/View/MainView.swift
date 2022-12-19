//
//  ContentView.swift
//  Split
//
//  Created by Renato Oliveira Fraga on 12/19/22.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var splitManager = SplitManager()
    @FocusState private var amountIsFocused: Bool
    
    var body: some View {
        VStack {
            HeaderView()
            Spacer()
            VStack(spacing: 10) {
                Text("Per Person")
                    .font(.title2.bold())
                Text(splitManager.perPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .font(.title2)
                    .frame(width: 200, height: 40)
                    .background(RoundedRectangle(cornerRadius: 50).foregroundColor(.white))
                    .shadow(radius: 1.0, x: 1.0, y: 1.0)
            }
            Spacer()
            VStack(spacing:10) {
                Text("Choose a tip")
                    .font(.title2.bold())
                HStack(spacing:20) {
                    Button(action: {
                        splitManager.isZeroPercentPressed = true
                        splitManager.isTenPercentPressed = false
                        splitManager.isFifteenPercentPressed = false
                        splitManager.isTwentyPercentPressed = false
                    }, label: {
                        SquareButton(title: "0%" ,selected: splitManager.isZeroPercentPressed)
                    })
                    
                    Button(action: {
                        splitManager.isZeroPercentPressed = false
                        splitManager.isTenPercentPressed = true
                        splitManager.isFifteenPercentPressed = false
                        splitManager.isTwentyPercentPressed = false
                    }, label: {
                        SquareButton(title: "10%", selected: splitManager.isTenPercentPressed)
                    })
                    
                    Button(action: {
                        splitManager.isZeroPercentPressed = false
                        splitManager.isTenPercentPressed = false
                        splitManager.isFifteenPercentPressed = true
                        splitManager.isTwentyPercentPressed = false
                    }, label: {
                        SquareButton(title: "15%", selected: splitManager.isFifteenPercentPressed)
                    })
                    Button(action: {
                        splitManager.isZeroPercentPressed = false
                        splitManager.isTenPercentPressed = false
                        splitManager.isFifteenPercentPressed = false
                        splitManager.isTwentyPercentPressed = true
                    }, label: {
                        SquareButton(title: "20%", selected: splitManager.isTwentyPercentPressed)
                    })
                    
                    
                }
            }
            Spacer()
            VStack {
                Text("Total per Person")
                    .font(.title2.bold())
                Text(splitManager.totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .font(.title2)
                    .frame(width: 200, height: 40)
                    .background(RoundedRectangle(cornerRadius: 50).foregroundColor(.white))
                    .shadow(radius: 1.0, x: 1.0, y: 1.0)
            }
            Spacer()
            
        }
        .background(Color("background"))
        .ignoresSafeArea(.container, edges: .top)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


