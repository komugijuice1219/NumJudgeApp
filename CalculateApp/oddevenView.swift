//
//  OddevenView.swift
//  CalculateApp
//
//  Created by たお1219 on 2024/11/27.
//

import SwiftUI

struct oddevenView: View {
    @State private var numA :String = ""
    @State private var numB :String = ""
    @State private var selection: String = "All"
    private let options = ["All", "Odd","Even"]
    @State private var result: [Int] = []
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.3), Color.blue.opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.purple.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 300, height: 300)
                .offset(x: 150, y: -200)
                .blur(radius: 50)
            
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.orange.opacity(0.5), Color.red.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 200, height: 200)
                .offset(x: -150, y: 150)
                .blur(radius: 50)
            VStack {
                Text("数字リスト生成")
                    .font(.largeTitle)
                    .bold()
                
                HStack{
                    TextField("from", text: $numA)
                        .padding()
                        .frame(width: 100)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("to", text: $numB)
                        .padding()
                        .frame(width: 100)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Picker("Option",selection: $selection){
                    ForEach(options, id: \.self) { option in
                        Text(option)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 350)
                
                List(result, id: \.self) { number in
                    Text("\(number)")
                        .font(.title3)
                }
                .frame(maxHeight: 350)
                
                Spacer().frame(height: 30)
                HStack {
                    Button(action: generateList) {
                        Text("生成リスト")
                            .font(.title3)
                            .padding()
                            .frame(width: 150)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    Button(action: resetFields) {
                        Text("リセット")
                            .font(.title3)
                            .padding()
                            .frame(width: 150)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
        }
    }
    func generateList(){
        guard let from = Int(numA), let to = Int(numB), from <= to else {
            result = []
            return
        }
        
        switch selection {
        case "All":
            result = Array(from...to)
        case "Odd":
            result = Array(from...to).filter { $0 % 2 != 0 }
        case "Even":
            result = Array(from...to).filter { $0 % 2 == 0 }
        default:
            result = []
        }
    }
    
    func resetFields() {
        numA = ""
        numB = ""
        result = []
        selection = "All"
    }
}

#Preview {
    oddevenView()
}
