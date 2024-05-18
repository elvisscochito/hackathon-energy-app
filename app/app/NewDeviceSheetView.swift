//
//  NewDeviceSheetView.swift
//  app
//
//  Created by Elviro Dominguez Soriano on 18/05/24.
//

import SwiftUI

struct NewDeviceSheetView: View {
    @State private var name = ""
    @State private var ip = ""
    
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Text("Nuevo dispositivo")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Form {
                TextField("Nombre", text: $name)
                TextField("Ip", text: $ip)
                
                Button(action: postDevice) {
                    Text("Agregar dispositivo")
                }
            }
        }
    }
    
    private func postDevice() {
        guard let url = URL(string: "http://localhost:3001/devices") else {
            print("URL no válida")
            return
        }

        // Crear la solicitud URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        // Crear el diccionario con los datos del nuevo dispositivo
        let newDeviceData: [String: Any] = ["name": name, "status": true, "ip": ip]

        // Convertir el diccionario a JSON
        guard let jsonData = try? JSONSerialization.data(withJSONObject: newDeviceData) else {
            print("Error al convertir los datos a JSON")
            return
        }

        // Asignar el cuerpo de la solicitud
        request.httpBody = jsonData

        // Establecer el tipo de contenido como JSON
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // Realizar la solicitud
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error en la solicitud: \(error.localizedDescription)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Respuesta inválida del servidor")
                return
            }

            // Manejar la respuesta si es necesario
            print("Dispositivo agregado exitosamente")

            // Limpiar los campos después de agregar el dispositivo
            DispatchQueue.main.async {
                name = ""
                ip = ""
            }
        }.resume()
    }


}

#Preview {
    NewDeviceSheetView()
}
