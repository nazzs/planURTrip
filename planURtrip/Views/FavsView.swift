//
//  FavsView.swift
//  planURtrip
//
//  Created by Naz Sevim on 7.07.2023.
//

import SwiftUI

struct FavsView: View {

    @State private var selectedTab = 0
    
    var body: some View {
        VStack {
            Spacer()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 45) {
                    ForEach(0..<3) { index in
                        Button(action: {
                            selectedTab = index
                        }) {
                            VStack {
                                Text("\(tabName(forIndex: index))")
                                    .foregroundColor(selectedTab == index ? .purple : .black)
                                    .frame(height: 44)
                                                            
                                Rectangle()
                                    .frame(height: 2)
                                    .foregroundColor(selectedTab == index ? .purple : .clear)
                            }
                        }
                    }
                }
                .frame(width: 360)
                .padding(.horizontal)
            }
            
            TabView(selection: $selectedTab) {
                ForEach(0..<3) { index in
                    
                    Hotels()
                        .tag(0)
                    Spacer()
                    FoodDrinks()
                        .tag(1)
                    
                    Spacer()
                    Destinations()
                        .tag(2)
                    Text("Content of Tab \(tabName(forIndex: index))")
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
        }
    }
    
    func tabName(forIndex index: Int) -> String {
        switch index {
        case 0:
            return "Oteller"
        case 1:
            return "Yiyecek\nİçecek"
        case 2:
            return "Gezilecek\nYerler"
        default:
            return ""
        }
    }
}

struct Hotels: View {
    @State var isPressed = false 

    var body: some View {
        VStack {
            HStack {
                Spacer()
                ScrollView {
                    Spacer()
                    VStack() {
                        ZStack {
                            Image(systemName: "heart.fill")
                                .opacity(isPressed ? 1 : 0)
                                .scaleEffect(isPressed ? 1.0 : 0.1)
                                .animation(.linear(duration: 0.2))
                            Image(systemName: "heart")
                        }.font(.system(size: 20))
                            .position(x: 330, y: 30)
                            .onTapGesture {
                                self.isPressed.toggle()
                            }
                            .foregroundColor(isPressed ? .purple : .purple)
                        
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

                }
            }
        }
    }
}


struct FoodDrinks: View {
    @State var isPressed = false

    var body: some View {
        VStack {
            HStack {
                Spacer()
                ScrollView {
                    Spacer()
                    VStack() {
                        ZStack {
                            Image(systemName: "heart.fill")
                                .opacity(isPressed ? 1 : 0)
                                .scaleEffect(isPressed ? 1.0 : 0.1)
                                .animation(.linear(duration: 0.2))
                            Image(systemName: "heart")
                        }.font(.system(size: 20))
                            .position(x: 330, y: 30)
                            .onTapGesture {
                                self.isPressed.toggle()
                            }
                            .foregroundColor(isPressed ? .purple : .purple)
                        
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
                    
                }
            }
        }
    }
}

struct Destinations: View {
    @State var isPressed = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                ScrollView {
                    Spacer()
                    VStack() {
                        ZStack {
                            Image(systemName: "heart.fill")
                                .opacity(isPressed ? 1 : 0)
                                .scaleEffect(isPressed ? 1.0 : 0.1)
                                .animation(.linear(duration: 0.2))
                            Image(systemName: "heart")
                        }.font(.system(size: 20))
                            .position(x: 330, y: 30)
                            .onTapGesture {
                                self.isPressed.toggle()
                            }
                            .foregroundColor(isPressed ? .purple : .purple)
                        
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
            }
        }
    }
}



struct FavsView_Previews: PreviewProvider {
    static var previews: some View {
        FavsView()
    }
}
