//
//  PlanView.swift
//  planURtrip
//
//  Created by Naz Sevim on 13.07.2023.
//

import SwiftUI

struct PlanView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var selected = 0

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
                }

                FirstDayView()
            }
        }.navigationBarBackButtonHidden()
    }
}

struct PlanView_Previews: PreviewProvider {
    static var previews: some View {
        PlanView()
    }
}
