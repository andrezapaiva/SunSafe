//
//  AlarmPageView.swift
//  SunSafe
//
//  Created by Andreza Paiva on 10/02/23.
//

import Foundation
import SwiftUI

struct AlarmPageView: View {
    @State var dailyAlarms:[AlarmModel] = [AlarmModel()]
    
    var progressValue: Float {
        return Float(Double(timesApplied)/Double(dailyAlarms.count))
    }
    
    @State private var timesApplied: Int = 0
    
    var date = Date()
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            
            
            VStack {
                
                Text(date.formatDate(format: "EEEE, d MMMM"))
                    .padding(.top, 7)
                    .foregroundColor(Color("black"))
                    .font(.system(size: 20, weight: .light))
                
                Divider()
                    .padding(.top, 0.5)
                
                ScrollView {
                    
                    ZStack {
                        Color("background")
                            .ignoresSafeArea()
                        
                        VStack {
                            
                            HStack {
                                Text("Alarmes")
                                    .foregroundColor(Color("black"))
                                    .font(.system(size: 27, weight: .bold))
                                    .padding(.top, 15)
                                    .padding(.leading)
                                Spacer()
                                
                                Button(action: {
                                    dailyAlarms.append(AlarmModel())
                                    print(dailyAlarms.count)
                                }, label: {
                                    
                                    Image(systemName: "plus")
                                        .foregroundColor(Color("yellow"))
                                        .font(.system(size: 30, weight: .light))
                                        .padding(.top, 15)
                                        .padding(.trailing)
                                })
                            }
                            
                            Text("Adicione os horários que você deseja aplicar protetor solar")
                                .padding(.top, 5)
                                .foregroundColor(Color("grey"))
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 50)
                            
                            List {
                                ForEach($dailyAlarms) { alarm in
                                    Section {
                                        AlarmView(alarm: alarm)
                                    }
                                    
                                }.onDelete(perform: {index in
                                    dailyAlarms.remove(at: Int(index.first!))
                                })
                                
                            }
                            .frame(height: 135*CGFloat(dailyAlarms.count))
                            .padding(.top, -20)
                            .shadow(color: Color("grey").opacity(0.05), radius: 4, x: 3, y: 3)
                            .scrollContentBackground(.hidden)
                            
                            HStack {
                                Text("Meta diária")
                                    .foregroundColor(Color("black"))
                                    .font(.system(size: 27, weight: .bold))
                                    .padding(.leading)
                                Spacer()
                                
                                HStack {
                                    
                                    Button () {
                                        if (progressValue) > 0.0 {
                                            timesApplied -= 1
                                        }
                                    } label: {
                                        
                                        Image ("botaoMenos")
                                            .padding(.top, 5)
                                            .padding(.trailing, 3)
                                        
                                    }
                                    
                                    Button () {
                                        if (progressValue) < 1.0 {
                                            timesApplied += 1
                                        }
                                    } label: {
                                        
                                        Image ("botaoMais")
                                            .padding(.top, 5)
                                            .padding(.trailing, 23)
                                        
                                    }
                                    
                                }
                                
                            }
                            
                            ZStack {
                                
                                ProgressBar(progress: self.progressValue)
                                    .frame(width: 160.0, height: 160.0)
                                    .padding(20.0)
                                
                                
                                Text("\(timesApplied) / \(dailyAlarms.count)")
                                    .foregroundColor(timesApplied == dailyAlarms.count ? Color("yellow") : Color("grey"))
                                    .font(.system(size: 22, weight: .bold))
                               
                            }
                            
                            HStack {
                                Text("Você aplicou protetor solar \(timesApplied) \(setPlural(timesApplied)) hoje. Aplique mais vezes para cumprir sua meta diária")
                                    .padding(.top, 5)
                                    .foregroundColor(Color("grey"))
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 50)
                            }
                        }
                    }
                    .navigationTitle("SunSafe")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
    
    func setPlural(_ number: Int) -> String {
       return timesApplied == 1 ? "vez" : "vezes"
        
//        if timesApplied == 1 {
//            return "vez"
//        }
//        else {
//            return "vezes"
//        }
    }
}
struct AlarmPageView_Previews: PreviewProvider {
    static let dailyAlarms:[AlarmModel] = [AlarmModel(), AlarmModel(), AlarmModel(), AlarmModel()]
    
    
    static var previews: some View {
        AlarmPageView(dailyAlarms: dailyAlarms)
    }
}

