//
//  PlansView.swift
//  planURtrip
//
//  Created by Naz Sevim on 7.07.2023.
//

import SwiftUI

struct PlansView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var isPressed = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ScrollView {
                        HStack {
                            Text("Gezilecek Yerler")
                                .foregroundColor(.black)
                        }
                        .frame(width: 180, height: 40)
                        .background(.white)
                        .cornerRadius(radius: 18.0, corners: [.topLeft])
                        .cornerRadius(radius: 18.0, corners: [.topRight])
                        .shadow(radius: 10)
                        
                        
                        NavigationLink(destination: FirstDayView(), label: {
                            VStack() {
                                HStack {
                                    ZStack(alignment: .center) {
                                        Image("kelebekler")
                                            .resizable()
                                            .frame(width: 182, height: 150)
                                            .cornerRadius(18)
                                            .shadow(radius: 20)
                                            .foregroundColor(.black)
                                            .padding(.leading, 70)
                                        
                                        Image("loryma")
                                            .resizable()
                                            .frame(width: 182, height: 150)
                                            .cornerRadius(18)
                                            .shadow(radius: 20)
                                            .foregroundColor(.black)
                                            .padding(.leading, 5)
                                        
                                        Image("voyagetorba")
                                            .resizable()
                                            .frame(width: 182, height: 150)
                                            .cornerRadius(18)
                                            .shadow(radius: 20)
                                            .foregroundColor(.black)
                                            .padding(.trailing, 70)
                                            
                                    }
                                    
                                    Text("1. Plan")
                                        .foregroundColor(.black)
                                        .font(.system(size: 20))
                                        .padding(.leading,10)
                                }
                            }
                            .frame(width: 360, height: 180)
                            .background(.white)
                            .cornerRadius(18)
                            .shadow(radius: 10)
                            .padding(.trailing, 9.5)
                            .padding(.horizontal)
                        })
                    }
                }
            }
        }.navigationBarBackButtonHidden()
    }
}

struct PlansView_Previews: PreviewProvider {
    static var previews: some View {
        PlansView()
    }
}
