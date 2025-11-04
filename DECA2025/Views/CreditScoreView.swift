//
//  CreditScoreView.swift
//  DECA2025
//
//  Created by Harri SN on 1/20/25.
//Classmate. begins today. 6/26/25 jhtughHhurhiiih

import SwiftUI

struct CreditScoreView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack (alignment: .leading) {
                    Text("Ethan,")
                        .font(.custom("TruistTrio-Regular", size: 40))
                    
                    Text("Here's an overview of your credit.")
                        .font(.custom("TruistTrio-Light", size: 30))
                    HStack {
                        Text("Services provided by")
                            .font(.custom("TruistTrio-Light", size: 15))
                        Image("Experian")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                    }
                }
                .padding([.top, .leading], 30)
                .padding(.top)
                Spacer()
            }
            Rectangle()
                .frame(width: 700, height: 800)
                .cornerRadius(20)
                .foregroundColor(Color("BG"))
                .overlay {
                    VStack (alignment: .leading) {
                        HStack {
                            Text("CREDIT")
                                .font(.custom("TruistTrio-Regular", size: 25))
                                .padding([.top, .leading],40)
                            .foregroundColor(Color("Truist"))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.custom("TruistTrio-Regular", size: 25))
                                .padding([.top, .trailing],40)
                            .foregroundColor(Color("Truist"))
                        }
                        VStack (alignment: .leading) {
                            HStack (alignment: .bottom) {
                                Text("726")
                                    .font(.custom("TruistTrio-Bold", size: 60))
                                    .padding(.leading, 40)
                                .padding(.top)
                                Spacer()
                                Rectangle()
                                    .frame(width: 100, height: 40)
                                    .cornerRadius(15)
                                    .foregroundColor(Color.white)
                                    .overlay {
                                        Text("Good")
                                            .font(.custom("TruistTrio-Regular", size: 20))
                                            .foregroundColor(Color.green)
                                    }
                                    .padding(.trailing, 40)
                            }
                            
                            HStack (alignment: .center) {
                                Text("FICO SCORE 8")
                                    .padding(.leading, 40)
                                    .padding(.top,-20)
                                .font(.custom("TruistTrio-light", size: 20))
                                Image(systemName: "info.circle")
                                    .font(.custom("TruistTrio-light", size: 16))
                                    .padding(.top,-20)

                            }


                        }
                        VStack {
                            ZStack (alignment: .leading) {
                                Rectangle()
                                    .cornerRadius(50)
                                    .frame(width: 620, height: 40)
                                    
                                    .foregroundColor(Color("Gray"))
                                
                                Rectangle()
                                    .cornerRadius(50)
                                    .frame(width: 560, height: 40)
                            
                                    .foregroundColor(Color("Truist"))

                            }
                            .padding(.top)
                            HStack {
                                Text("300")
                                    .font(.custom("TruistTrio-light", size: 16))
                                Spacer()
                                
                               Text("800")
                                    .font(.custom("TruistTrio-light", size: 16))

                            }
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                        }
                        .padding(.leading, 40)
                        .padding(.trailing)
                        Divider()
                            .padding(.leading, 40)
                            .padding(.trailing)
                        VStack (alignment: .leading) {
                            Text("Things bringing down your credit score:")
                                .font(.custom("TruistTrio-Light", size: 30))
                            Group {
                                CreditTile(name: "High credit usage", color: Color.red, status: "HURTING")
                                CreditTile(name: "Loan balances", color: Color.red, status: "HURTING")
                                CreditTile(name: "Short account history", color: Color.red, status: "HURTING")
                                CreditTile(name: "No missed payments", color: Color.green, status: "HELPING")
                                CreditTile(name: "Recent credit card usage", color: Color.green, status: "HELPING")
                                CreditTile(name: "Many accounts paid on time", color: Color.green, status: "HELPING")
                            }
                        }
                        .padding(.leading, 40)
                        .padding(.trailing)
                        Spacer()
                    }
                }
            Spacer()
        }
        .frame(width: 700, height: 1000)

    }
}

struct CreditScoreView_Previews: PreviewProvider {
    static var previews: some View {
        //CreditTile(name: "High credit usage", color: Color.red, status: "HURTING")
        //CreditScoreView()
        NewCreditView()
            .previewLayout(.sizeThatFits)
    }
}

struct CreditTile: View {
    var name: String
    var color: Color
    var status: String
    var body: some View {
        Rectangle()
            .frame(width: 600, height: 50)
            .cornerRadius(10)
            .foregroundColor(Color.white)
            .overlay {
            HStack {
                    Text(name)
                    .font(.custom("TruistTrio-Regular", size: 20))
                Spacer()
                Rectangle()
                    .frame(width: 110, height: 40)
                    .foregroundColor(color.opacity(0.25))
                    .cornerRadius(20)
                    .overlay {
                        Text(status)
                            .font(.custom("TruistTrio-Regular", size: 16))
                            .foregroundColor(color)
                    }
            }
            .padding(.leading, 40)
            .padding(.trailing)
        }
            .padding(.trailing)
    }
}

struct NewCreditView: View {
    var body: some View {
        Text("")
    }
}
