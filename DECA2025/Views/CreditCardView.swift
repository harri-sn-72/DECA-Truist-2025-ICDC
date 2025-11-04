//
//  CreditCardView.swift
//  DECA2025
//
//  Created by Harri SN on 1/20/25.
//

import SwiftUI

struct CreditCardView: View {
    var image: String
    var name: String
    var balance: String
    var paymentDate: Date
    var totalBalance: String
    var subText: String
    
    @Environment(\.dismiss) var dismiss
   
    var body: some View {
        ScrollView() {
            VStack (alignment: .center, spacing: 5) {
             Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 550)
                    .padding(.top, 40)
                HStack (alignment: .center) {
                    Image("Visa")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75)
                    Text(name)
                        //.textCase(.uppercase)
                    .font(.custom("TruistTrio-Light", size: 24))
                }
                Text("Ethan Williams")
                    .font(.custom("TruistTrio-Regular", size: 20))
                Text(subText)
                    .font(.custom("TruistTrio-Light", size: 20))
                    .padding(.bottom)

                HStack (spacing: 10) {
                    TileView(tile: "Manage", image: "creditcard.trianglebadge.exclamationmark")
                    TileView(tile: "Lock", image: "lock.fill")
                    TileView(tile: "Info", image: "info.circle.fill")
                    TileView(tile: "Cancel", image: "x.square")
                }
                .padding(.bottom)

                Divider()
                    .padding(.horizontal, 30)
                ScrollView {

                HStack {
                    VStack (spacing: 3) {
                        Rectangle()
                            .frame(width: 300, height: 100)
                            .padding(.top)
                            .cornerRadius(15)
                        .foregroundColor(Color("BG"))
                        .overlay(alignment: .leading) {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Total Balance")
                                    .font(.custom("TruistTrio-Bold", size: 16))
                                Text("$\(balance)")
                                    .font(.custom("TruistTrio-Regular", size: 24))
                                Text("$\(totalBalance) available")
                                    .font(.custom("TruistTrio-Light", size: 14))
                                
                            }
                            .padding(.leading)
                            .padding(.top)
                        }
                        Rectangle()
                            .frame(width: 300, height: 100)
                            .padding(.top)
                            .cornerRadius(15)
                        .foregroundColor(Color("BG"))
                        .overlay(alignment: .leading) {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Weekly Activity")
                                    .font(.custom("TruistTrio-Bold", size: 16))
                                HStack (spacing: 27) {
                                    VStack (spacing: 3) {
                                        ZStack (alignment: .bottom) {
                                            Rectangle()
                                                .cornerRadius(5)
                                                .frame(width: 15, height: 40)
                                                
                                                .foregroundColor(Color("Gray"))
                                            
                                            Rectangle()
                                                .cornerRadius(5)
                                                .frame(width: 15, height: 30)
                                        
                                                .foregroundColor(Color("Truist"))

                                        }
                                        Text("M")
                                            .font(.custom("TruistTrio-Bold", size: 14))

                                    }
                                    VStack (spacing: 3) {
                                        ZStack (alignment: .bottom) {
                                            Rectangle()
                                                .cornerRadius(5)
                                                .frame(width: 15, height: 40)
                                                
                                                .foregroundColor(Color("Gray"))
                                            
                                            Rectangle()
                                                .cornerRadius(5)
                                                .frame(width: 15, height: 10)
                                        
                                                .foregroundColor(Color("Truist"))

                                        }
                                        Text("T")
                                            .font(.custom("TruistTrio-Bold", size: 14))

                                    }
                                    VStack (spacing: 3) {
                                        ZStack (alignment: .bottom) {
                                            Rectangle()
                                                .cornerRadius(5)
                                                .frame(width: 15, height: 40)
                                                
                                                .foregroundColor(Color("Gray"))
                                            
                                            Rectangle()
                                                .cornerRadius(5)
                                                .frame(width: 15, height: 20)
                                        
                                                .foregroundColor(Color("Truist"))

                                        }
                                        Text("W")
                                            .font(.custom("TruistTrio-Bold", size: 14))

                                    }
                                    VStack (spacing: 3) {
                                        ZStack (alignment: .bottom) {
                                            Rectangle()
                                                .cornerRadius(5)
                                                .frame(width: 15, height: 40)
                                                
                                                .foregroundColor(Color("Gray"))
                                            
                                            Rectangle()
                                                .cornerRadius(5)
                                                .frame(width: 15, height: 5)
                                        
                                                .foregroundColor(Color("Truist"))

                                        }
                                        Text("TH")
                                            .font(.custom("TruistTrio-Bold", size: 14))

                                    }
                                    VStack (spacing: 3) {
                                        ZStack (alignment: .bottom) {
                                            Rectangle()
                                                .cornerRadius(5)
                                                .frame(width: 15, height: 40)
                                                
                                                .foregroundColor(Color("Gray"))
                                            
                                            Rectangle()
                                                .cornerRadius(5)
                                                .frame(width: 15, height: 25)
                                        
                                                .foregroundColor(Color("Truist"))

                                        }
                                        Text("F")
                                            .font(.custom("TruistTrio-Bold", size: 14))

                                    }
                                    VStack (spacing: 3) {
                                        ZStack (alignment: .bottom) {
                                            Rectangle()
                                                .cornerRadius(5)
                                                .frame(width: 15, height: 40)
                                                
                                                .foregroundColor(Color("Gray"))
                                            
                                            Rectangle()
                                                .cornerRadius(5)
                                                .frame(width: 15, height: 40)
                                        
                                                .foregroundColor(Color("Truist"))

                                        }
                                        Text("S")
                                            .font(.custom("TruistTrio-Bold", size: 14))

                                    }
                                    VStack (spacing: 3) {
                                        ZStack (alignment: .bottom) {
                                            Rectangle()
                                                .cornerRadius(5)
                                                .frame(width: 15, height: 40)
                                                
                                                .foregroundColor(Color("Gray"))
                                            
                                            Rectangle()
                                                .cornerRadius(5)
                                                .frame(width: 15, height: 35)
                                        
                                                .foregroundColor(Color("Truist"))

                                        }
                                        Text("F")
                                            .font(.custom("TruistTrio-Bold", size: 14))

                                    }


                                }
                                .padding(.bottom, 5)
                            }
                            .padding(.leading)
                            .padding(.top)
                        }
                        
                    }
                    
                    Spacer()
                    Rectangle()
                        .frame(width: 300, height: 220)
                        .padding(.top)
                        .cornerRadius(15)
                    .foregroundColor(Color("BG"))
                    .overlay(alignment: .leading) {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Payment Due On")
                                .font(.custom("TruistTrio-Bold", size: 16))

                            Text("\(paymentDate.formatted(date: .complete, time: .omitted))")
                                .font(.custom("TruistTrio-Regular", size: 24))
                            Text("$49 late fee is applied if past this date.")
                                .font(.custom("TruistTrio-Light", size: 14))
                            
                            Rectangle()
                                .frame(width: 85, height: 35)
                                .cornerRadius(10)
                                .foregroundColor(Color("Truist"))
                                .overlay {
                                    Text("Pay Now")
                                        .foregroundColor(Color.white)
                                        .font(.custom("TruistTrio-Regular", size: 16))
                                }
                            
                        }
                        .padding(.leading)
                        .padding(.top)
                    }
                }
                .frame(width: 640)
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

                Spacer()
            }
            .frame(width: 700, height: 1000)
        }
    }
}

struct CreditCardView_Previews: PreviewProvider {
    static var previews: some View {
        CreditCardView(image: "deltadebit", name: "Delta SkyMiles Business Debit 2751", balance: "2,901.19", paymentDate: Date(), totalBalance: "7,269.62", subText: "Employee of North Carolina DECA since 2025.")
            .previewLayout(.sizeThatFits)
    }
}
