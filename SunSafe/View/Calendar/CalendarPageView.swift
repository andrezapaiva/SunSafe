//
//  CalendarPageView.swift
//  SunSafe
//
//  Created by Andreza Paiva on 06/03/23.
//

import Foundation
import SwiftUI

struct CalendarPageView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var matriz: [[String]]
    
    var body: some View {
        
        NavigationView{
            ZStack {
                Color("background")
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Spacer()
                        
                        //                    ZStack(alignment: .leading) {
                        //
                        //                        HStack(alignment: .center){
                        //                            Spacer()
                        
                        Button {
                            dismiss()
                            
                        } label: {
                            
                            Image(systemName: "arrow.left.circle")
                                .foregroundColor(Color("yellow"))
                                .font(.system(size: 30, weight: .light))
                                .padding(.top, 15)
                                .padding(.leading)
                            
                        }
                        Text("Histórico")
                            .foregroundColor(Color("black"))
                            .font(.system(size: 27, weight: .bold))
                            .padding(.top, 15)
                            .padding(.leading)
                        
                        ScrollView{
                        }
                    }
                    
                    VStack{
                        ForEach(Array(matriz.enumerated()), id: \.offset) { line, colContent in
                            HStack{
                                ForEach(Array(colContent.enumerated()), id: \.offset) { col, item in
                                    //                                let color:Color = item.1 ? .red : .gray
                                    CalendarDay(color: .gray, cornerRadius: 5, text: "\(item)")
                                        .padding(-3)
                                        .onTapGesture {
                                            //                                        itemTapped(line, col)
                                        }
                                }
                            }
                            
                        }
                        
                    }.navigationBarTitle("SunSafe")
                        .padding()
                }.animation(.default)
                
            }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
//    }
//}

//    func itemTapped(_ line:Int, _ col:Int) {
//        guard let _ = Int(matriz[line][col].0) else {return}
//        matriz[line][col].1.toggle()
//    }


//struct CalendarPageView_Previews: PreviewProvider {
//    static var matriz = calendarMatrix2Dic(date: Date().addingTimeInterval(-20*24*60*60))
//
//    static var previews: some View {
//        CalendarPageView(matriz: Self.matriz)
//    }
//}
