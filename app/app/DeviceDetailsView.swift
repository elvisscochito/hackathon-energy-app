//
//  DeviceDetailsView.swift
//  app
//
//  Created by Elviro Dominguez Soriano on 18/05/24.
//

import SwiftUI

struct DeviceDetailsView: View {
    let device: DeviceModel
    
    
    var body: some View {
        VStack {
            VStack () {
                Text(device.name)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            .padding()

        }
        .navigationTitle(device.name)
    }
}

#Preview {
    DeviceDetailsView(device: DeviceModel.init(_id: "1", name: "Aa", status: true, ip: "192.228.17.57", consumption: 10))
}
