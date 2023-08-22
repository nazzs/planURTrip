//
//  FirstDayView.swift
//  planURtrip
//
//  Created by Naz Sevim on 19.07.2023.
//

import SwiftUI

struct FirstDayView: View {
    var body: some View {
        NavigationView {
        
            ScrollView {
                HStack {
                    Text("1. Gün")
                        .foregroundColor(.black)
                    NavigationLink(destination: SecondDayView(), label: {
                        Image(systemName: "chevron.right")
                    })
                }
                .frame(width: 180, height: 40)
                .background(.white)
                .cornerRadius(radius: 18.0, corners: [.topLeft])
                .cornerRadius(radius: 18.0, corners: [.topRight])
                .shadow(radius: 10)
                
                VStack {
                    HStack(alignment: .center) {
                        Image("voyagetorba")
                            .resizable()
                            .frame(width: 182, height: 150)
                            .cornerRadius(18)

                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text("9,8")
                                    .foregroundColor(Color.black)
                                    .bold()
                                    .font(.system(size: 20))

                                Text("(436)")
                                    .foregroundColor(Color.gray)
                                    .bold()
                                    .font(.system(size: 12))
                                    .padding(.top, 10)
                            }
                            
                            Text("Voyage Torba Private")
                                .foregroundColor(Color.black)
                                .font(.system(size: 17))
                                .frame(width: 101, height: 41)
                                .padding(.top, 25)
                            
                            HStack {
                                Text("Gecelik")
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 12))
                                
                                Text("₺5525")
                                    .foregroundColor(Color.black)
                                    .bold()
                                    .font(.system(size: 17))
                            }
                            .frame(width: 110, height: 20)
                            .padding(.top, 15)
                            .padding(.leading, 40)
                        }
                    }
                    .padding(.bottom, 15)
                    .padding(.trailing, 1)
                }
                .frame(width: 360, height: 180)
                .background(.white)
                .cornerRadius(18)
                .shadow(radius: 10)
                .padding(.trailing, 9.5)
                .padding(.horizontal)
                
                
                
                VStack() {
                    HStack(alignment: .center) {
                        Image("loryma")
                            .resizable()
                            .frame(width: 182, height: 150)
                            .cornerRadius(18)

                        VStack(alignment: .leading) {
                            HStack {
                                Text("4,7")
                                    .foregroundColor(Color.black)
                                    .bold()
                                    .font(.system(size: 20))
                                    .padding(.top, 0)

                                Text("(1253)")
                                    .foregroundColor(Color.gray)
                                    .bold()
                                    .font(.system(size: 12))
                                    .padding(.top, 10)
                            }
                            
                           
                            Text("Loryma Restaurant")
                                .foregroundColor(Color.black)
                                .font(.system(size: 17))
                                .frame(width: 150, height: 30)

                            Text("Deniz Mahsülleri, Akdeniz")
                                .foregroundColor(Color.gray)
                                .font(.system(size: 12))
                                .frame(width: 150, height: 30)

                            HStack {
                                Image(systemName: "mappin")
                                    .font(.system(size: 12))
                                
                                Text("Taşlıca Mahallesi, Muğla")
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 11))
                            }
                            .frame(width: 150, height: 30)
                            
                        }
                    }
                    .padding(.bottom, 13)
                   
                }
                .frame(width: 360, height: 180)
                .background(.white)
                .cornerRadius(18)
                .shadow(radius: 10)
                .padding(.trailing, 9.5)
                .padding(.horizontal)
                
                
                
                VStack() {
                    HStack(alignment: .center) {
                        Image("kelebekler")
                            .resizable()
                            .frame(width: 182, height: 150)
                            .cornerRadius(18)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text("4,2")
                                    .foregroundColor(Color.black)
                                    .bold()
                                    .font(.system(size: 20))
                                    .padding(.bottom)
                                
                                Text("(1892)")
                                    .foregroundColor(Color.gray)
                                    .bold()
                                    .font(.system(size: 12))
                                    .padding(.bottom, 10)
                            }
                            
                            Text("Kelebekler Vadisi")
                                .foregroundColor(Color.black)
                                .font(.system(size: 17))
                                .padding(.top, 0)
                            
                            HStack {
                                Image(systemName: "mappin")
                                    .font(.system(size: 12))
                                
                                Text("Fethiye, Muğla")
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 11))
                            }
                            .padding(.top, 50)
                        }
                    }
                    .padding(.bottom, 14)
                    
                }
                .frame(width: 360, height: 180)
                .background(.white)
                .cornerRadius(18)
                .shadow(radius: 10)
                .padding(.trailing, 9.5)
                .padding(.horizontal)
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct FirstDayView_Previews: PreviewProvider {
    static var previews: some View {
        FirstDayView()
    }
}
