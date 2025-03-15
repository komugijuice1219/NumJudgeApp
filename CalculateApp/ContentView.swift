//
//  ContentView.swift
//  CalculateApp
//
//  Created by たお1219 on 2024/11/26.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        
            TabView {
               
                CalculateView()
                    .tabItem {
                        Label("calc", systemImage: "plus.forwardslash.minus")
                    }
                
   
                ComparisonView()
                    .tabItem {
                        Label("comp", systemImage: "greaterthan")
                    }
                
           
                JudgementView()
                    .tabItem {
                        Label("judge", systemImage: "hourglass.start")
                    }
                
         
                oddevenView()
                    .tabItem {
                        Label("oddeven", systemImage: "list.dash")
                    }
            
                greetingView()
                    .tabItem {
                        Label("greeting", systemImage: "clock.arrow.circlepath")
                    }
        }
    }
}

#Preview {
    ContentView()
}
