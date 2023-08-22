//
//  SearchView.swift
//  planURtrip
//
//  Created by Naz Sevim on 7.07.2023.
//

import SwiftUI
struct SearchView: View {
    
    @State var startDate = Date()
    @State var endDate = Date()
    @Binding var searchText: String
    @Binding var toNext: Bool
    let transition = AnyTransition.asymmetric(insertion: .move(edge: .trailing), removal: .offset(x: -24))
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.black)
                    
                    TextField("Nereye gitmek istiyorsun?", text: $searchText)
                        .foregroundColor(.gray)
                        .overlay(
                            Image(systemName: "xmark.circle.fill")
                                .padding()
                                .offset(x: 10)
                                .foregroundColor(Color.black)
                                .opacity(searchText.isEmpty ? 0.0 : 1.0)
                                .onTapGesture {
                                    searchText = ""
                                }
                            ,alignment: .trailing
                        )
                }
                .font(.headline)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .shadow(color: .black,
                                radius: 10, x: 0, y: 0)
                )
                .padding(.leading, 20)
                
                Button(action: {}, label: {
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                            .font(.system(size: 20))
                            .foregroundColor(.purple)
                        
                        Text("Şu anki konumu kullan")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 12)
                    .padding(.leading, 180)
                })
                
                
                Text("Başlangıç tarihi")
                    .padding(.horizontal)
                    .padding(.top, 60)
                    .foregroundColor(Color.black)
                
                HStack {
                    Image(systemName: "calendar")
                        .font(.system(size: 26.0))
                    DatePicker("Tarih girin", selection: $startDate, in: Date()..., displayedComponents: .date)
                        .datePickerStyle(DefaultDatePickerStyle())
                }
                .frame(width: 376, height: 48)
                .background(.white)
                .cornerRadius(10)
                .shadow(radius: 20)
                .padding(.horizontal)
                
                Text("Bitiş tarihi")
                    .padding(.horizontal)
                    .padding(.top, 32)
                
                HStack {
                    Image(systemName: "calendar")
                        .font(.system(size: 26.0))
                    DatePicker("Tarih girin", selection: $endDate, in: startDate..., displayedComponents: .date)
                        .datePickerStyle(DefaultDatePickerStyle())
                }
                .frame(width: 376, height: 48)
                .background(.white)
                .cornerRadius(10)
                .shadow(radius: 20)
                .padding(.horizontal)
                
                HStack {
                    Spacer()
                    NavigationLink("Tamam", destination: HotelView(), isActive: $toNext)
                        .foregroundColor(Color.white)
                        .frame(width: 100, height: 40)
                        .background(.purple)
                        .cornerRadius(10)
                        .padding(.top, 150)
                        .padding(.trailing)
                        
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}
   

struct HotelView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var isPressed = false
    @State var isPressed1 = false
    @State var isPressed2 = false
    @State var isPressed3 = false
    @State var isPressed4 = false
    @State var isPressed5 = false
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                        .toolbar(content: {
                            ToolbarItem(placement:
                                    .navigationBarLeading) {
                                        Button{
                                            presentationMode.wrappedValue.dismiss()
                                        } label: {
                                            Image(systemName: "chevron.left")
                                                
                                        }
                                    }
                        })
                        .toolbar(content: {
                            ToolbarItem(placement:
                                    .navigationBarTrailing) {
                                        NavigationLink(destination: FoodDrinkView()) {
                                            Image(systemName: "chevron.right")
                                        }
                                    }
                        })
                    
                    ScrollView {
                        HStack {
                            Text("Oteller")
                                .foregroundColor(.black)
                        }
                        .frame(width: 180, height: 40)
                        .background(.white)
                        .cornerRadius(radius: 18.0, corners: [.topLeft])
                        .cornerRadius(radius: 18.0, corners: [.topRight])
                        .shadow(radius: 10)
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
                        
                        
                        VStack() {
                            ZStack {
                                Image(systemName: "heart.fill")
                                    .opacity(isPressed1 ? 1 : 0)
                                    .scaleEffect(isPressed1 ? 1.0 : 0.1)
                                    .animation(.linear(duration: 0.2))
                                Image(systemName: "heart")
                            }.font(.system(size: 20))
                                .position(x: 330, y: 30)
                                .onTapGesture {
                                    self.isPressed1.toggle()
                                }
                                .foregroundColor(isPressed1 ? .purple : .purple)
                            
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
                            ZStack {
                                Image(systemName: "heart.fill")
                                    .opacity(isPressed2 ? 1 : 0)
                                    .scaleEffect(isPressed2 ? 1.0 : 0.1)
                                    .animation(.linear(duration: 0.2))
                                Image(systemName: "heart")
                            }.font(.system(size: 20))
                                .position(x: 330, y: 30)
                                .onTapGesture {
                                    self.isPressed2.toggle()
                                }
                                .foregroundColor(isPressed2 ? .purple : .purple)
                            
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
                            ZStack {
                                Image(systemName: "heart.fill")
                                    .opacity(isPressed3 ? 1 : 0)
                                    .scaleEffect(isPressed3 ? 1.0 : 0.1)
                                    .animation(.linear(duration: 0.2))
                                Image(systemName: "heart")
                            }.font(.system(size: 20))
                                .position(x: 330, y: 30)
                                .onTapGesture {
                                    self.isPressed3.toggle()
                                }
                                .foregroundColor(isPressed3 ? .purple : .purple)
                            
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
                        
                        
                        VStack {
                            ZStack {
                                Image(systemName: "heart.fill")
                                    .opacity(isPressed4 ? 1 : 0)
                                    .scaleEffect(isPressed4 ? 1.0 : 0.1)
                                    .animation(.linear(duration: 0.2))
                                Image(systemName: "heart")
                            }.font(.system(size: 20))
                                .position(x: 330, y: 30)
                                .onTapGesture {
                                    self.isPressed4.toggle()
                                }
                                .foregroundColor(isPressed4 ? .purple : .purple)
                            
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
                        
                        VStack {
                            ZStack {
                                Image(systemName: "heart.fill")
                                    .opacity(isPressed5 ? 1 : 0)
                                    .scaleEffect(isPressed5 ? 1.0 : 0.1)
                                    .animation(.linear(duration: 0.2))
                                Image(systemName: "heart")
                            }.font(.system(size: 20))
                                .position(x: 330, y: 30)
                                .onTapGesture {
                                    self.isPressed5.toggle()
                                }
                                .foregroundColor(isPressed5 ? .purple : .purple)
                            
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
        }.navigationBarBackButtonHidden()
    }
}

struct FoodDrinkView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var isPressed = false

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                        .toolbar(content: {
                            ToolbarItem(placement:
                                    .navigationBarLeading) {
                                        Button{
                                            presentationMode.wrappedValue.dismiss()
                                        } label: {
                                            Image(systemName: "chevron.left")
                                        }
                                    }
                        })
                        .toolbar(content: {
                            ToolbarItem(placement:
                                    .navigationBarTrailing) {
                                        NavigationLink(destination:
                                        DestinationView()) {
                                            Image(systemName: "chevron.right")
                                        }
                                    }
                        })
                    
                    ScrollView {
                        HStack {
                            Text("Yiyecek&İçecek")
                                .foregroundColor(.black)
                        }
                        .frame(width: 180, height: 40)
                        .background(.white)
                        .cornerRadius(radius: 18.0, corners: [.topLeft])
                        .cornerRadius(radius: 18.0, corners: [.topRight])
                        .shadow(radius: 10)
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
        }.navigationBarBackButtonHidden()
    }
}

struct DestinationView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var isPressed = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                        .toolbar(content: {
                            ToolbarItem(placement:
                                    .navigationBarLeading) {
                                        Button{
                                            presentationMode.wrappedValue.dismiss()
                                        } label: {
                                            Image(systemName: "chevron.left")
                                        }
                                    }
                        })
                        .toolbar(content: {
                            ToolbarItem(placement:
                                    .navigationBarTrailing) {
                                        NavigationLink("Plan Yap", destination: PlanView())
                                    }
                        })
                    
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
        }.navigationBarBackButtonHidden()
    }
}


//one-sided rounding
struct CornerRadiusShape: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}



struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchText: .constant(""), toNext: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
