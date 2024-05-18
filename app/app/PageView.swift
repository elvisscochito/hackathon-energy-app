//
//  PageView.swift
//  app
//
//  Created by Elviro Dominguez Soriano on 18/05/24.
//

import SwiftUI

struct PageView: View {
    var page: PageModel
    
    var body: some View {
        VStack {
            Spacer()
            Text(page.title)
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.orange)
                .multilineTextAlignment(.center)
                .padding()
            Text(page.headline)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
        }
    }
    
}

#Preview {
    PageView(page: PageModel.defaultPage)
}
