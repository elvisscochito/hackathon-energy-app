//
//  TabBarView.swift
//  app
//
//  Created by Elviro Dominguez Soriano on 18/05/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView(selection: .constant(1),
                content: {
            (HomeView())
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(1)
        })
        .accentColor(.orange)
    }
}


#Preview {
    TabBarView()
}
