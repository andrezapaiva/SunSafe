//
//  AlarmPageView.swift
//  SunSafe
//
//  Created by Andreza Paiva on 10/02/23.
//

import Foundation
import SwiftUI
import CodableExtensions


struct AlarmPageView: View {
    @ObservedObject var user = User.shared

//     var dailyAlarms : [AlarmModel] =
    
//    func aaaa() {
//        let xxx = user.history[today]?.dailyAlarms
//        let yyy = user.history[today]?.timesApplied
//    }

 //   private var numberOfDailyAlarms: Int {dailyAlarms.count}
    
    var progressValue: Float {
        return Float(Double(timesApplied)/Double((activeAlarms == 0 ) ? 1 : activeAlarms))
    }
    var activeAlarms: Int {
        user.history[Date.today]?.dailyAlarms.filter({$0.enabled}).count ?? 0
    }
    
    @State var timesApplied: Int = 0 {
        didSet {
            user.history[Date.today]?.timesApplied = timesApplied
        }
    }
    
    var fractionAnimation: Float {
        activeAlarms == 0 ? 0.4 : 1
    }
    
    var date = Date()
    
    var singularOrPlural: String {
        timesApplied == 1 ? "vez" : "vezes"
    }
    
 //   @AppStorage("CONTAGEM_TIMES_APPLIED") var counter = 0
 //   @AppStorage("CONTAGEM_DAILY_ALARMS") var counter2 = 0
    
    
    var body: some View {
        
        VStack {
            
                Text(Date.dateFormatStyle.format(Date.now))
                    .padding(.top, 7)
                    .foregroundColor(Color("black"))
                .font(.system(size: 20, weight: .light))
                
            Divider()
                .padding(.top, 0.5)
            
            List {
                Group {
                    alarmsHeader
                    alarmsText
                    alarmsListView
                    metasHeader
                    metasCirculo
                    metasTexto
                }
                //                        .animation(.default, value: dailyAlarms)
                .frame(maxWidth: .infinity)
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden, edges: .all)
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("SunSafe")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
        }
        .onAppear{
            timesApplied = user.history[Date.today]?.timesApplied ?? 0
        }
        .background(Color("background"))
    }
    
    var alarmsHeader: some View {
        HStack {
            Text("Alarmes")
                .foregroundColor(Color("black"))
                .font(.system(size: 27, weight: .bold))
                .padding(.top, 15)
                .padding(.leading)
            Spacer()
            
            Button(action: {
                print("Addei!")
                withAnimation {
                    user.history[Date.today]!.dailyAlarms.append(AlarmModel(id: UUID()))
                }
                
            }, label: {
                
                Image(systemName: "plus")
                    .foregroundColor(Color("yellow"))
                    .font(.system(size: 30, weight: .light))
                    .padding(.top, 15)
                    .padding(.trailing)
            })
        }
    }
    
    var alarmsText: some View {
        Text("Adicione os horários que você deseja aplicar protetor solar")
            .padding(.top, 5)
            .foregroundColor(Color("grey"))
            .font(.subheadline)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 50)
            .padding(.vertical, 8)
    }
    
    
    func update(time: Date, enabled: Bool, at index: Int) {
        let alarm = user.history[Date.today]!.dailyAlarms[index]
        print(user.history[Date.today]!.dailyAlarms[index].id)
        alarm.time = time
        alarm.enabled = enabled
        user.history[Date.today]?.dailyAlarms[index] = alarm
        print("CHAMEI!")
        print(alarm.id)
    }
    
    
    var alarmsListView: some View {
        ForEach(Array((user.history[Date.today]?.dailyAlarms  ?? []).enumerated()), id: \.offset) { idx, alarm in
            Section {
                AlarmView(alarm: alarm, timesApplied: $timesApplied, index: idx, closure: update)
                    .padding(.horizontal, 12)
                    .background {
                        Color("alarmbox")
                            .cornerRadius(8)
                            .shadow(color: Color("grey").opacity(0.05), radius: 4, x: 3, y: 3)
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
            }
            
        }.onDelete(perform: {index in
            user.history[Date.today]?.dailyAlarms[Int(index.first!)].cancelAlarm()
            user.history[Date.today]?.dailyAlarms.remove(at: Int(index.first!))
//            timesApplied -= 1
        })
        .onChange(of: activeAlarms) { _ in
            if timesApplied > activeAlarms {
                timesApplied = activeAlarms
            }
        }
        
//    }.onAppear {
//        // lê os dados salvos
//         dailyAlarms.load()
    }
    
    var metasHeader: some View {
        HStack {
            Text("Meta diária")
                .foregroundColor(Color("black"))
                .font(.system(size: 27, weight: .bold))
                .padding(.leading)
            Spacer()
            
            HStack {
                
                Button {
//                    if progressValue > 0.0 {
                        timesApplied -= 1
//                    }
                } label: {
                    
                    Image ("botaoMenos")
                        .padding(.top, 5)
                        .padding(.trailing, 3)
                        .opacity(timesApplied <= 0 ? 0.4 : 1.0)
                    
                }
                .disabled(timesApplied <= 0)
                
                Button {
//                    if progressValue < 1.0 {
                        timesApplied += 1
//                    }
                } label: {
                    
                    Image ("botaoMais")
                        .padding(.top, 5)
                        .opacity(timesApplied >= activeAlarms ? 0.4 : 1.0)
                    
                }
                .disabled(timesApplied >= activeAlarms)
                .padding(.trailing, 23)
            }
            .buttonStyle(.plain)
        }
        .padding(.top, 20)
    }
    
    var metasCirculo: some View {
        ZStack {
            ProgressBar(progress: self.progressValue)
                .frame(width: 160.0, height: 160.0)
                .padding(20.0)
            
            
            Text("\(timesApplied) / \(activeAlarms)")
                .foregroundColor(timesApplied == activeAlarms && activeAlarms != 0 ? Color("yellow") : Color("grey"))
                .opacity(Double(fractionAnimation))
                .animation(.easeInOut(duration: 0.2), value: fractionAnimation)
                .font(.system(size: 22, weight: .bold))
            
        }
        .animation(.easeInOut.speed(1.1), value: self.progressValue)
    }
    
    var metasTexto: some View {
        HStack {
            Text("Você aplicou protetor solar \(timesApplied) \(singularOrPlural) hoje")
                .padding(.top, 5)
                .foregroundColor(Color("grey"))
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 50)
                .foregroundColor(Color("grey"))
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 50)
        }
    }
}


//struct AlarmPageView_Previews: PreviewProvider {
//    static let dailyAlarms:[AlarmModel] = [AlarmModel(), AlarmModel(), AlarmModel(), AlarmModel()]
//    
//    
//    static var previews: some View {
//        AlarmPageView()
//    }
//}

