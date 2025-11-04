//
//  TruistView.swift
//  DECA2025
//
//  Created by Harri SN on 1/20/25.
//

import SwiftUI
import MapKit

struct TruistView: View {
    @State var textInput = ""
    @State var logoAnimating = false
    @State var timer: Timer?
    @State var chatService = ChatService()
    @Environment(\.dismiss) var dismiss
    @State private var messageID = 0
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 28.450395, longitude: -81.4888174), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    let annotations = [
        City(name: "Truist Orange County", coordinate: CLLocationCoordinate2D(latitude: 28.450395, longitude: -81.4888174))
    ]
    @State private var isLoading = false

    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ZStack (alignment: .top) {
                        Rectangle()
                            .frame(width: 700, height: 105)
                            .cornerRadius(15)
                            .foregroundColor(Color("Truist"))
                            .overlay(alignment: .bottom) {
                                HStack(alignment: .center) {
                                    Text("Powered by OpenAI GPT-4")
                                        .font(.custom("TruistTrio-Regular", size: 12))
                                        .foregroundColor(Color.white)
                            
                                }
                                .padding(.bottom, 10)
                            }
                            
                        Rectangle()
                            .frame(width: 700, height: 75)
                            .cornerRadius(15)
                            .foregroundColor(Color("LightGray"))
                            .overlay(alignment: .center) {
                                HStack {
                                    Image("TruistLogo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150)
                                    Text("ASSIST")
                                        .font(.custom("TruistTrio-Regular", size: 24))
                                        .foregroundColor(Color("Truist"))
                                        .padding(.leading, 6.75)
                                }
                            }
                        
                    }
                    .padding(.bottom)
                    .padding(.top, 25)

                    HStack (alignment: .bottom) {
                        Image("TFC")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .padding()
                        Text("Hello Ethan, what can I help you with?")
                            .font(.custom("TruistTrio-Light", size: 20))
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color("Truist"))
                        .cornerRadius(16)
                        Spacer()
                    }
                    VStack {
                        if chatService.messages.count == 0 {
                            VStack {
                                HStack (alignment: .bottom) {
                                    Spacer()
                                    
                                    Button(action: {
                                        isLoading = true
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                            isLoading = false
                                            messageID.self = 1
                                        }
                                        textInput = "Where is the nearest Truist branch?"
                                        sendMessage()
                                    }) {
                                        PreMessageView(text: "What is the nearest Truist branch?")
                                    }
                                }
                                HStack (alignment: .bottom) {
                                    Spacer()
                                    
                                    Button(action: {
                                        isLoading = true
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                            isLoading = false
                                            messageID.self = 2
                                        }

                                        textInput = "Show me my recent transactions."
                                        sendMessage()
                                    }) {
                                        PreMessageView(text: "Show me my recent transactions.")
                                    }
                                }
                                HStack (alignment: .bottom) {
                                    Spacer()
                                    
                                    Button(action: {
                                        isLoading = true
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                            isLoading = false
                                            messageID.self = 3
                                        }

                                        textInput = "My credit card got stolen."
                                        sendMessage()
                                    }) {
                                        PreMessageView(text: "My credit card got stolen.")
                                    }
                                }
                                HStack (alignment: .bottom) {
                                    Spacer()
                                    
                                    Button(action: {
                                        isLoading = true
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                            isLoading = false
                                            messageID.self = 4
                                        }

                                        textInput = "What is my credit score?"
                                        sendMessage()
                                    }) {
                                        PreMessageView(text: "What is my credit score?")
                                    }
                                }
                            }
                            .padding(.trailing)
                            .padding(.top)
                        }
                        else {
                        }
                    }
                    .padding(.bottom)
                    ForEach(chatService.messages) { chatMessage in
                        // MARK: Chat message view
                        messageView(message: chatMessage)
                    }
                    .padding(.top)
                    
                    if isLoading == true {
                        HStack (alignment: .bottom) {
                            LottieView(loopMode: .loop)
                                        .scaleEffect(0.2)
                            Spacer()
                        }
                    } 
                    else {
                        
                    }

                    if messageID == 1 {
                        VStack {
                            HStack {
                                Map(coordinateRegion: $region, interactionModes: [.zoom], showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: annotations) { map in
                                    MapMarker(coordinate: map.coordinate, tint: Color("Truist"))
                                }
                                .cornerRadius(15)
                                    .frame(width: 400, height: 300)
                                    .padding(.leading, 60)
                                    .padding(.bottom, 5)
                                Spacer()
                            }
                            HStack (alignment: .bottom) {
                                Image("TFC")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .padding()
                                Text("The nearest Truist location to you is at 7677 Dr Phillips Blvd, Orlando, FL 32819, 3 miles from the Orange County Convention Center. The bank is open from 9 AM to 5 PM on Monday-Thursday, 9 AM to 6 PM on Friday, and closed on the weekends. Would you like to book an appoinment?")
                                    .font(.custom("TruistTrio-Light", size: 20))
                                    .foregroundColor(Color.white)
                                    .padding()
                                    .background(Color("Truist"))
                                .cornerRadius(16)
                                Spacer()
                            }
                        }
                    }
                    else if messageID == 2 {
                        VStack {
                            HStack (alignment: .bottom) {
                                Image("TFC")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .padding()
                                Text("Here are your transactions:")
                                    .font(.custom("TruistTrio-Light", size: 20))
                                    .foregroundColor(Color.white)
                                    .padding()
                                    .background(Color("Truist"))
                                .cornerRadius(16)
                                Spacer()
                            }
                            
                            
                            HStack {
                                
                                VStack (alignment: .leading) {
                                    Text("This Week")
                                        .font(.custom("TruistTrio-Bold", size: 18))
                                        .padding(.top, 20)
                                        .padding(.leading, 60)
                                    Group {
                                        TransactionTile(place: "Nike", icon: "Nike", amount: "59.98", type: "Clothing")
                                        TransactionTile(place: "McDonalds", icon: "McDonalds", amount: "12.67", type: "Food and Drink")
                                    
                                        TransactionTile(place: "Netflix", icon: "Netflix", amount: "22.99", type: "Entertainment")
                                        TransactionTile(place: "Doordash", icon: "Doordash", amount: "15.24", type: "Food and Drink")
                                    }
                                    .padding(.leading, 30)
                                }
                                Spacer()
                            }
                        }
                    }
                    else if messageID == 3 {
                        HStack (alignment: .bottom) {
                            Image("TFC")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                                .padding()
                            Text("I'm sorry to hear that. I have automatically locked your credit card ending in 8562 and reported the theft to our fraud detection department. Would you like me to order a new card?")
                                .font(.custom("TruistTrio-Light", size: 20))
                                .foregroundColor(Color.white)
                                .padding()
                                .background(Color("Truist"))
                            .cornerRadius(16)
                            Spacer()
                        }
                    }
                    else if messageID == 4 {
                        HStack (alignment: .bottom) {
                            Image("TFC")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                                .padding()
                            Text("Your credit score as of February 28, 2024 is 726. With a 726, you're in the good range, which means lenders will likely see you as a low-risk borrower. This can help you qualify for loans or credit cards with favorable terms, such as lower interest rates. It's a solid score, and with a bit of improvement, you could even move into the \("very good") category!")
                                .font(.custom("TruistTrio-Light", size: 20))
                                .foregroundColor(Color.white)
                                .padding()
                                .background(Color("Truist"))
                            .cornerRadius(16)
                            Spacer()
                        }
                    }
                    ForEach(chatService.messages) { chatMessage in
                        // MARK: Chat message view
                        messageView(message: chatMessage)
                    }

                }
            }
            HStack {
                TextField("Ex. book an appointment", text: $textInput) {
                    
                }
                    .padding()
                    .background(Color("BG"))
                    .cornerRadius(12)
                    .foregroundColor(.black)
                Button(action: {
                    sendMessage()
                }) {
                    Image(systemName: "paperplane")
                        .foregroundColor(.black)
                        .padding()
                        .background(Color("BG"))
                        .cornerRadius(12)
                }
            }
            .padding(.bottom, 25)
        }
        .padding()
        .frame(height: 1000)

    }
    func messageView(message: ChatMessage) -> some View {
        HStack {
            HStack (alignment: .bottom) {
                if message.role == .user {Spacer()}
                if message.role == .model {
                    Image("TFC")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .padding()
                }
                Text(message.message)
                    .font(.custom("TruistTrio-Light", size: 20))
                    .foregroundColor(message.role == .model ? Color.white : Color.black)
                    .padding()
                    .background(message.role == .model ? Color("Truist") : Color.gray.opacity(0.25))
                .cornerRadius(16)
                .multilineTextAlignment(.leading)
                if message.role == .user {
                    Image(systemName: "person.crop.square")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .padding()
                        .foregroundColor(Color("Truist"))
                }
                if message.role == .model {Spacer()}
            }

        }
    }
    
    // MARK: Fetch response
    func sendMessage() {
        chatService.sendMessage(textInput)
        textInput = ""
    }
    // MARK: Response loading animation
    func startLoadingAnimation() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { timer in
            logoAnimating.toggle()
        })
    }
    
    func stopLoadingAnimation() {
        logoAnimating = false
        timer?.invalidate()
        timer = nil
    }
}


struct TruistChatView_Preview: PreviewProvider {
    static var previews: some View {
    TruistView()
        
            .previewLayout(.sizeThatFits)
    }
}

struct PreMessageView: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.custom("TruistTrio-Light", size: 16))
            .foregroundStyle(.black)
            .multilineTextAlignment(.trailing)
            .padding(.vertical)
                .frame(maxWidth: 300)
                .background(
                    Capsule()
                        .strokeBorder(Color.black,lineWidth: 1)
                        .clipped()
                )
                .clipShape(Capsule())
    }
}
