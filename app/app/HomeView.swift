//
//  HomeView.swift
//  app
//
//  Created by Elviro Dominguez Soriano on 18/05/24.
//

import SwiftUI

struct HomeView: View {
    @State private var isShowingSheet = false
    @State private var devicesData: [DeviceModel] = []
    
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Bienvenido,")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                Text("Braulio Esquivel")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            VStack {
                NavigationStack{
                    
                    ScrollView {
                        ForEach(devicesData, id: \._id) { device in
                            NavigationLink(destination: DeviceDetailsView(device: device)) {
                                DeviceCardView(device: device)
                            }
                        }
                    }
                    
    //                VStack {
    //                    NavigationLink(destination: TicketView()) {
    //                        Text("Navigate")
    //                    }
    //                }
                    
                    .navigationBarItems(trailing: Button(action: {
                        isShowingSheet.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    })
                    .fontWeight(.bold))
                    .navigationTitle("Dispositivos")
                }
                
                .sheet(isPresented: $isShowingSheet, content: {
                    (NewDeviceSheetView())
                })
            }
            
//            List(devicesData, id: \._id) { device in
//                VStack(alignment: .leading) {
//                    Text(device.name)
//                        .font(.headline)
//                    Text(device.status)
//                        .font(.subheadline)
//                        .foregroundColor(device.status == "active" ? .green : .red)
//                }
//            }
        }
        .onAppear(perform: getDevices)
    }
    
    private func getDevices() {
        guard let url = URL(string: "http://localhost:3001/devices") else {
            print("URL no válida")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error en la solicitud: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Respuesta inválida del servidor")
                return
            }
            
            guard let data = data else {
                print("Datos vacíos")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([DeviceModel].self, from: data)
                DispatchQueue.main.async {
                    self.devicesData = decodedData
                }
            } catch {
                print("Error al decodificar los datos: \(error.localizedDescription)")
            }
        }.resume()
    }
}


#Preview {
    HomeView()
}
