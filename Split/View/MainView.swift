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
                        .padding(.vertical)
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
            .cornerRadius(20)
            Spacer()
            VStack(spacing: 10) {
                Text("Per Person")
                    .font(.title2.bold())
                    .foregroundColor(.black)
                Text(splitManager.perPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .font(.title2)
                    .foregroundColor(.black)
                    .frame(width: 200, height: 40)
                    .background(RoundedRectangle(cornerRadius: 50).foregroundColor(Color(.white)))
                    //.shadow(radius: 1.0, x: 1.0, y: 1.0)
            }
            Spacer()
            VStack(spacing:10) {
                Text("Choose a tip")
                    .font(.title2.bold())
                    .foregroundColor(.black)
                HStack(spacing:20) {
                    Button(action: {
                        splitManager.zeroPressed()
                    }, label: {
                        SquareButton(title: "0%" ,selected: splitManager.isZeroPercentPressed)
                    })
                    
                    Button(action: {
                        splitManager.tenPressed()
                    }, label: {
                        SquareButton(title: "10%", selected: splitManager.isTenPercentPressed)
                    })
                    
                    Button(action: {
                        splitManager.fiftenPressed()
                    }, label: {
                        SquareButton(title: "15%", selected: splitManager.isFifteenPercentPressed)
                    })
                    Button(action: {
                        splitManager.twentyPressed()
                    }, label: {
                        SquareButton(title: "20%", selected: splitManager.isTwentyPercentPressed)
                    })
                    
                    
                }
            }
            Spacer()
            VStack {
                Text("Total per Person")
                    .font(.title2.bold())
                    .foregroundColor(.black)
                Text(splitManager.totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .font(.title2)
                    .foregroundColor(.black)
                    .frame(width: 200, height: 40)
                    .background(RoundedRectangle(cornerRadius: 50).foregroundColor(.white))
                    //.shadow(radius: 1.0, x: 1.0, y: 1.0)
            }
            Spacer(minLength: 100)
            
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


