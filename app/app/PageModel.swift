//
//  PageModel.swift
//  app
//
//  Created by Elviro Dominguez Soriano on 18/05/24.
//

import Foundation

struct PageModel: Identifiable, Equatable {
    let id = UUID()
    var title: String
    var headline: String
    var pageNumber: Int
    
    static var defaultPage = PageModel(title: "Title", headline: "Aa", pageNumber: 0)
    
    static var samplePages: [PageModel] = [
        PageModel(title: "Ahorra energía", headline: "Apagando dispositivos que no usas", pageNumber: 0),
        PageModel(title: "Consulta", headline: "Mira lo que gasta cada dispositivo en consumo energético", pageNumber: 1),
        PageModel(title: "Agrega", headline: "Agrega dispositivos a tu red domestica", pageNumber: 2)
    ]
}
