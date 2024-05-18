//
//  DeviceCardView.swift
//  app
//
//  Created by Elviro Dominguez Soriano on 18/05/24.
//

import SwiftUI

struct DeviceCardView: View {
    var device: DeviceModel
    
    @State private var isDeviceOn: Bool // Estado del dispositivo

        init(device: DeviceModel) {
            self.device = device
            self._isDeviceOn = State(initialValue: device.status)
        }
    
    var body: some View {
        HStack {
            Text(device.name)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            Text("\(device.consumption) vatios")
                .font(.headline)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.black)
            
            Toggle("", isOn: isDeviceOnBinding) // Toggle para el estado del dispositivo
                            .padding(.top, 10)
                            .padding(.bottom, 20)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .center)
    }
    
    var isDeviceOnBinding: Binding<Bool> {
            Binding<Bool>(
                get: { self.isDeviceOn },
                set: { newValue in
                    self.isDeviceOn = newValue
                    // Aquí puedes agregar la lógica para actualizar el estado del dispositivo en la base de datos u otro lugar
                }
            )
        }
}

#Preview {
    //DeviceCardView(device: DeviceModel.defaultDevice)
    DeviceDetailsView(device: DeviceModel.init(_id: "1", name: "Lamp", status: true, ip: "192.228.17.57", consumption: 10))
}
