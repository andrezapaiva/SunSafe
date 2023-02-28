//
//  Authorization.swift
//  SunSafe
//
//  Created by Andreza Paiva on 25/02/23.
//

import Foundation
import SwiftUI

struct OnboardingAuthorization: View {
    
    @EnvironmentObject private var user: User
    
    var body: some View {
        VStack {
            VStack {
                //            .frame(width: 150)
                VStack(spacing: 15) {
                    Text("O SunSafe precisa da sua autorização para ler e armazenar os seus dados de saúde.")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal, 45)
                .padding(.bottom, 90)
                
                Button {
//                    HealthKitManager.shared.setUpHealthRequest()
                } label: {
                    Text("Permitir")
                        .padding(.vertical, 8)
                        .padding(.horizontal, 15)
                        .background(Color("yellow"), in: RoundedRectangle(cornerRadius: 15))
                }
            }
            Spacer()
        }
        //    .frame(maxWidth: .infinity, maxHeight: .infinity)
      //  .background("background")
    }
}
