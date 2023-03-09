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
    
    @State var matriz: [[(String,Bool)]]
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                ZStack {
                    Color("background")
                        .ignoresSafeArea()
                    
                    VStack {
                        //                        Spacer()
                        //
                        //                        ZStack(alignment: .leading) {
                        //
                        //                            HStack(alignment: .center){
                        //                                Spacer()
                        //
                        //                                Text("Histórico")
                        //                                    .foregroundColor(Color("black"))
                        //                                    .font(.system(size: 27, weight: .bold))
                        //                                    .lineLimit(1)
                        
                        Button {
                            dismiss()
                            
                        } label: {
                            
                            Image(systemName: "arrow.left.circle")
                                .foregroundColor(Color("yellow"))
                                .frame(width: 30, height: 30, alignment: .topLeading)
                                .font(.system(size: 30, weight: .light))
                                .padding(.leading)
                        }
                    }
                }
                HStack {
                }
                ForEach(Array(matriz.enumerated()), id: \.offset) { line, colContent in
                    HStack{
                        ForEach(Array(colContent.enumerated()), id: \.offset) { col, item in
                            let color:Color = item.1 ? .red : .gray
                            CalendarDay(color: color, cornerRadius: 5, text: "\(item.0)")
                                .padding(-3)
                                .onTapGesture {
                                    itemTapped(line, col)
                                }
                        }
                        
                    }
                    
                }.navigationBarTitle("Histórico")
                
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    func itemTapped(_ line:Int, _ col:Int) {
        guard let _ = Int(matriz[line][col].0) else {return}
        matriz[line][col].1.toggle()
    }
}

//struct CalendarPageView_Previews: PreviewProvider {
//    static var matriz = calendarMatrix2Dic(date: Date().addingTimeInterval(-20*24*60*60))
//
//    static var previews: some View {
//        CalendarPageView(matriz: Self.matrix)
//    }
//}
