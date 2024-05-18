//
//  ContentView.swift
//  app
//
//  Created by Elviro Dominguez Soriano on 18/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isOnBoardingFinish = false
    @State private var currentPageIndex = 0
    
    private let pages: [PageModel] = PageModel.samplePages
    
    var body: some View {
        ZStack {
            if isOnBoardingFinish {
                MainContentView()
            } else {
                VStack {
                    
                    TabView(selection: $currentPageIndex) {
                        ForEach(pages.indices, id: \.self) { index in
                            PageView(page: pages[index])
                                .tag(index)
                        }
                    }
                    .animation(.easeInOut, value: currentPageIndex)
                    .tabViewStyle(.page)
                    .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                    .onAppear {
                        UIPageControl.appearance().currentPageIndicatorTintColor = .orange
                        UIPageControl.appearance().pageIndicatorTintColor = .gray
                    }
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            if currentPageIndex < pages.count - 1 {
                                withAnimation{
                                    currentPageIndex += 1
                                }
                            } else {
                                withAnimation{
                                    isOnBoardingFinish = true
                                }
                            }
                        }) {
                            if (currentPageIndex < pages.count - 1) {
                                Text("Next")
                                    .foregroundColor(.orange)
                                Image(systemName: "arrow.forward")
                                    .accentColor(.orange)
                            } else {
                                Text("Start")
                                    .foregroundColor(.orange)
                                Image(systemName: "arrow.right.circle.fill")
                                    .accentColor(.orange)
                            }
//                            Image(systemName: currentPageIndex < pages.count - 1 ? "arrow.forward" : "arrow.right.circle.fill")
                        }
                        .fontWeight(.heavy)
                        .font(.title3)
                    }
                    .padding()
                }
            }
        }
    }
    
    struct MainContentView: View {
        var body: some View {
            TabBarView()
        }
    }
}

#Preview {
    ContentView()
}
