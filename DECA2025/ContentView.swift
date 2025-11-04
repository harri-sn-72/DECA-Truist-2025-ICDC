//
//  ContentView.swift
//  DECA2025
//
//  Created by Harri SN on 1/20/25.
//

import SwiftUI
import WebKit


struct ContentView: View {
    @State private var showingSheet = false
    @State private var showingSheetB = false
    @State private var showingSheetZelle = false
    @State private var showingSheetCredit = false
    @State private var creditCard = false
    @State private var debitCard = false
    @State private var truistAssist = false
    @State private var webSheet = false

    var greetingMessage: String {
      let hour = Calendar.current.component(.hour, from: Date())
      if hour < 12 { return "Good morning," }
      if hour < 18 { return "Good afternoon," }
      return "Good evening,"
    }

    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                HStack {
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            truistAssist.toggle()
                            }) {
                                Image(systemName: "text.bubble")
                                    .font(.title)
                                
                            }
                            .sheet(isPresented: $truistAssist) {
                                TruistView()
                        }
                            .padding(.trailing)

                        Button(action: {
                            webSheet.toggle()
                            }) {
                                Image(systemName: "globe.badge.chevron.backward")
                                    .font(.title)
                                
                            }
                            .sheet(isPresented: $webSheet) {
                                WebView(url: URL(string: "https://truist.com/")!)
                        }
                    }
                    .padding(.trailing, 25)
                }
                .padding(.top,20)
                VStack (alignment: .leading) {
                    Group {
                        HStack {
                            Image("TFC")
                                .resizable()
                                .scaledToFit()
                            .frame(width: 50)
                            .padding(.leading, 40)
                            .padding(.top)
                            Spacer()
                        }
                        HStack {
                            VStack (alignment: .leading) {
                                Text("\(greetingMessage)")
                                    .font(Font.custom("TruistTrio-Regular", size: 42))
                                Text("Ethan Williams")
                                    .font(Font.custom("TruistTrio-Light", size: 42))
                            }
                            .padding(.leading, 40)
                            .frame(alignment: .leading)

                            Spacer()
                        }

                    }
                    .padding(.horizontal, 20)

                    Divider()
                        .padding(.horizontal, 40)
                    Group {
                        HStack {
                            Text("YOUR ACCOUNTS")
                                .font(.custom("TruistTrio-Light", size: 28))
                                .kerning(3)
                                .padding(.leading, 40)
                                .padding(.top, 15)
                            Spacer()
                        }
                        HStack {
                            VStack (alignment: .leading, spacing: 15)  {
                                Button(action: {
                                    showingSheetB.toggle()
                                }) {
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(Color("BG"))
                                        .frame(width: 650, height: 150)
                                        .padding(.leading, 40)
                                        .padding(.trailing, 40)
                                        .overlay {
                                            HStack {
                                                VStack(alignment: .leading, spacing: 8) {
                                                    Text("TRUIST EVERYDAY CHECKING ...7452")
                                                        .font(.custom("TruistTrio-Regular", size: 22))
                                                        .kerning(3)
                                                    Text("$2,071.76")
                                                        .font(.custom("TruistTrio-Light", size: 42))
                                                    Text("Available balance")
                                                        .font(.custom("TruistTrio-Light", size: 20))
                                                        
                                                }
                                                .foregroundColor(.black)
                                                
                                                .padding(.leading, 60)

                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .padding(.trailing, 50)
                                            }
                                    }
                                }
                                .sheet(isPresented: $showingSheetB) {
                                    AccountView(accName: "TRUIST EVERYDAY CHECKING ...7452", balance: "2,071.76")
                                }
                                
                                Button(action: {
                                    showingSheet.toggle()
                                }) {
                                    Rectangle()
                                        .cornerRadius(20)
                                        .foregroundColor(Color("BG"))
                                        .frame(width: 650, height: 150)
                                        .padding(.leading, 40)
                                        .padding(.trailing, 40)
                                        .overlay {
                                            HStack {
                                                VStack(alignment: .leading, spacing: 8) {
                                                    Text("TRUIST SAVINGS ACCOUNT ...4760")
                                                        .font(.custom("TruistTrio-Regular", size: 22))
                                                        .kerning(3)
                                                        
                                                    Text("$5,801.01")
                                                        .font(.custom("TruistTrio-Light", size: 42))
                                                    Text("Available balance")
                                                        .font(.custom("TruistTrio-Light", size: 20))
                                                        
                                                }
                                                .foregroundColor(.black)
                                                
                                                .padding(.leading, 60)

                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .padding(.trailing, 50)
                                            }
                                    }
                                }
                                .sheet(isPresented: $showingSheet) {
                                    AccountView(accName: "TRUIST SAVINGS ACCOUNT ...4760", balance: "5,801.01")
                                }

                            }
                            Spacer()
                        }
                        .padding(.bottom, 10)
                        Divider()
                            .padding(.horizontal, 40)
                        HStack {
                            Text("YOUR CARDS")
                                .font(.custom("TruistTrio-Light", size: 28))
                                .kerning(3)
                                .padding(.leading, 40)
                                .padding(.top, 15)
                            Spacer()
                        }
                        HStack{
                            VStack (alignment: .leading, spacing: 20) {
                                HStack {
                                    Image("deltadebit")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 300)
                                    VStack (alignment: .leading, spacing: 10) {
                                        Text("DELTA SKYMILES BUSINESS DEBIT VISA 2751")
                                            .font(.custom("TruistTrio-Regular", size: 20))
                                            .kerning(3)
                                        Text("Linked to savings ....4760")
                                            .font(.custom("TruistTrio-Light", size: 20))
                                        Text("North Carolina DECA")
                                            .font(.custom("TruistTrio-Light", size: 20))
                                        Button(action: {
                                            debitCard.toggle()
                                        }) {
                                            HStack {
                                                Text("View or manage card")
                                                    .font(.custom("TruistTrio-Light", size: 20))
                                                    .underline()
                                                Image(systemName: "chevron.right")
                                                    .font(.custom("TruistTrio-Light", size: 20))
                                            }
                                        }
                                        .sheet(isPresented: $debitCard) {
                                            CreditCardView(image: "deltadebit", name: "Delta SkyMiles Business Debit 2751", balance: "2,901.19", paymentDate: Date(), totalBalance: "7,269.62", subText: "Employee of North Carolina DECA since 2025.")
                                        }
                                        
                                    }
                                    .padding(.leading, 40)
                                    .padding(.trailing,40)
                                }
                                .padding(.leading, 40)
                                HStack {
                                    Image("truistcredit")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 300)
                                    VStack (alignment: .leading, spacing: 10) {
                                        Text("TRUIST ENJOY BEYOND CREDIT 8562")
                                            .font(.custom("TruistTrio-Regular", size: 20))
                                            .kerning(3)
                                        Text("Ethan Wiliams")
                                            .font(.custom("TruistTrio-Light", size: 20))
                                        Text("Expires June 2026")
                                            .font(.custom("TruistTrio-Light", size: 20))
                                        Button(action: {
                                            creditCard.toggle()
                                        }) {
                                            HStack {
                                                Text("View or manage card")
                                                    .font(.custom("TruistTrio-Light", size: 20))
                                                    .underline()
                                                Image(systemName: "chevron.right")
                                                    .font(.custom("TruistTrio-Light", size: 20))
                                            }
                                        }
                                        .sheet(isPresented: $creditCard) {
                                            CreditCardView(image: "truistcredit", name: "Truist Enjoy Beyond Credit 8562", balance: "5,982.92", paymentDate: Date(), totalBalance: "9,590.85", subText: "72,698 reward points accumulated since 2019.")
                                        }
                                        
                                    }
                                    .padding(.leading, 40)
                                    .padding(.trailing,40)
                                }
                                .padding(.leading, 40)
                            }
                        }
                        .padding(.bottom, 10)
                        Divider()
                            .padding(.horizontal, 40)
                    }
                    .padding(.horizontal, 20)

                    HStack {
                        Text("QUICK ACTIONS")
                            .font(.custom("TruistTrio-Light", size: 28))
                            .kerning(3)
                            .padding(.leading, 40)
                            .padding(.top, 15)
                        Spacer()
                    }
                    .padding(.horizontal, 20)

             
                    HStack (spacing: 10) {
                        Button(action: {
                            showingSheetZelle.toggle()
                        }) {
                            Image("Zelle")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(.black, lineWidth: 1)
                                }
                        }
                            .sheet(isPresented: $showingSheetZelle) {
                                NumpadView()
                            }
                        
                Button(action: {
                    truistAssist.toggle()
                    }) {
                        Image("Assist")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                            .overlay {
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.black, lineWidth: 1)
                            }
                        
                    }
                    .sheet(isPresented: $truistAssist) {
                        TruistView()
                    }
                Button(action: {
                    showingSheetCredit.toggle()
                    }) {
                        Image("Experian")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                            .frame(width: 200)
                            .padding(.vertical, 3)

                            .overlay {
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.black, lineWidth: 1)
                            }
                        
                    }
                    .sheet(isPresented: $showingSheetCredit) {
                        CreditScoreView()
                    }
                    }
            .padding(.trailing, 60)
            .padding(.leading, 60)
            .padding(.bottom)
                    Divider()
                        .padding(.horizontal, 40)
                    HStack {
                        Text("FINANCE TIP OF THE DAY")
                            .font(.custom("TruistTrio-Light", size: 28))
                            .kerning(3)
                            .padding(.leading, 40)
                            .padding(.top, 15)
                        Spacer()
                    }
                    .padding(.bottom)
                    .padding(.horizontal, 20)

                    HStack (alignment: .center) {
                        Image(systemName: "dollarsign.square")
                            .font(.custom("TruistTrio-Light", size: 65))
                            .foregroundColor(Color("Truist"))
                            .padding(.trailing, 10)
                            .padding(.leading, 40)
                        Text("Automate your savings by setting up recurring transfers to ensure consistent progress toward your financial goals without the effort.")
                            .font(.custom("TruistTrio-Light", size: 20))
                            .padding(.trailing, 20)



                    }
                    .padding(.horizontal, 20)
                    HStack (alignment: .center) {
                        Image(systemName: "dollarsign.square")
                            .font(.custom("TruistTrio-Light", size: 65))
                            .foregroundColor(Color.white)
                            .padding(.trailing, 10)
                            .padding(.leading, 40)
                        Text("Automate your savings by setting up recurring transfers to ensure consistent progress toward your financial goals without the effort.")
                            .font(.custom("TruistTrio-Light", size: 20))
                            .padding(.trailing, 20)
                            .foregroundColor(Color.white)



                    }
                    .padding(.horizontal, 20)

                }

            }
            .background(Color.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct WebView: UIViewRepresentable {
    @Environment(\.dismiss) var dismiss
 let url: URL
    func makeUIView(context: Context) -> WKWebView {
 return WKWebView()
 }
    func updateUIView(_ webView: WKWebView, context: Context) {
 let request = URLRequest(url: url)
 webView.load(request)
 }
}
