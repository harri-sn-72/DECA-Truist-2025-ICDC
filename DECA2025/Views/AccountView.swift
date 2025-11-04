//
//  AccountView.swift
//  DECA2025
//
//  Created by Harri SN on 1/20/25.
//

import SwiftUI

struct AccountView: View {
    var accName: String
    var balance: String
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack (alignment: .bottom) {
            Image("bank")
                .resizable()
            .scaledToFill()
            Rectangle()
                .frame(width: 700, height: 1000)
                .cornerRadius(20)
                .overlay(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text(accName)
                            .foregroundColor(Color.white)
                            .padding(.top, 20)
                            .padding(.leading, 30)
                            .font(.custom("TruistTrio-Regular", size: 18))
                        
                        HStack (alignment: .bottom) {
                            Text("$\(balance)")
                                .foregroundColor(Color.white)
                            .font(.custom("TruistTrio-Light", size: 44))
                            
                            Text("remaining")
                                .foregroundColor(Color.white)
                                .font(.custom("TruistTrio-Light", size: 18))
                                .padding(.bottom, 7)
                        }
                        .padding(.leading, 30)
                        HStack (spacing: 20) {
                    TileView(tile: "Transfer", image: "arrow.left.arrow.right")
                    TileView(tile: "Send $", image: "paperplane.fill")
                    TileView(tile: "Deposit", image: "arrow.down.doc")
                            TileView(tile: "Settings", image: "gear")
                        }
                        .padding(.leading, 30)
                        .padding(.top, -20)
                        Spacer()
                    }
                }
            Rectangle()
                .frame(width: 680, height: 825)
                .cornerRadius(20)
                .foregroundColor(Color.white)
                .overlay(alignment: .leading) {
                    ScrollView {
                        VStack(alignment: .leading) {
                            HStack(alignment: .center) {
                                Text("Transactions")
                                    .font(.custom("TruistTrio-Regular", size: 36))
                                Spacer()
                                Image(systemName: "line.3.horizontal.decrease")
                                    .font(.custom("TruistTrio-Regular", size: 26))
                                    .padding(.trailing, 60)

                            }
                            .padding(.bottom, 10)
                            Text("Yesterday")
                                .font(.custom("TruistTrio-Bold", size: 18))
                            Group {
                                TransactionTile(place: "Nike", icon: "Nike", amount: "59.98", type: "Clothing")
                                TransactionTile(place: "McDonalds", icon: "McDonalds", amount: "12.67", type: "Food and Drink")
                            }
                            Text("This Week")
                                .font(.custom("TruistTrio-Bold", size: 18))
                            Group {
                                TransactionTile(place: "Netflix", icon: "Netflix", amount: "22.99", type: "Entertainment")
                                TransactionTile(place: "Doordash", icon: "Doordash", amount: "15.24", type: "Food and Drink")
                                TransactionTile(place: "Apple", icon: "Apple", amount: "7,349.00", type: "Electronics")
                            }
                            Text("Last Week")
                                .font(.custom("TruistTrio-Bold", size: 18))
                            Group {
                                TransactionTile(place: "Spotify", icon: "Spotify", amount: "6.99", type: "Entertainment")
                                TransactionTile(place: "Starbucks", icon: "Starbucks", amount: "9.85", type: "Electronics")
                                TransactionTile(place: "Walmart", icon: "Walmart", amount: "70.64", type: "Groceries")
                                TransactionTile(place: "", icon: "", amount: "", type: "")
                            }
                            Spacer()
                        }
                        .padding(.leading, 30)
                    .padding(.top, 20)
                    }

                }
        }
        
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(accName: "TRUIST SAVINGS ACCOUNT ...4760", balance: "5,182.49")
    }
}


struct TileView: View {
    var tile: String
    var image: String
    var body: some View {
        Rectangle()
            .frame(width: 125, height: 45)
            .cornerRadius(50)
            .foregroundColor(Color("BG"))
            .overlay(alignment: .center) {
                HStack (alignment: .center) {
                    Text(tile)
                        .font(.custom("TruistTrio-Light", size: 18))
                        .foregroundColor(Color("Truist"))
                    
                    Image(systemName: image)
                        .font(.custom("TruistTrio-Light", size: 16))
                        .foregroundColor(Color("Truist"))


                }
            }
    }
}

struct TransactionTile: View {
    var place: String
    var icon: String
    var amount: String
    var type: String
    var body: some View {
        HStack (alignment: .center) {
            ZStack {
                Circle()
                    .frame(width: 70)
                    .foregroundColor(.white)
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 60)
            }
            VStack (alignment: .leading, spacing: 5) {
                Text(place)
                    .font(.custom("TruistTrio-Regular", size: 24))
                Text(type)
                    .font(.custom("TruistTrio-Light", size: 18))

            }
            .padding(.leading, 15)
            Spacer()
            Text("-$\(amount)")
                .padding(.trailing, 30)
                .font(.custom("TruistTrio-Bold", size: 28))
            
        }
        .padding(.leading, 30)
        .padding(.trailing, 30)
        .frame(width: 680, height: 100)
    }
}
