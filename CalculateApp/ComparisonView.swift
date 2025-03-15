//
//  ComparisonView.swift
//  CalculateApp
//
//  Created by たお1219 on 2024/11/26.
//

import SwiftUI

struct ComparisonView: View {
    @State private var Num1: String = ""
    @State private var Num2: String = ""
    @State private var result: String = ""
    @State private var resultMessage: String = ""
    @State private var errorMessage: String = ""
    
    var body: some View {
        ZStack{
            // 第一层圆形
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.6), Color.purple.opacity(0.55)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 500, height: 500)
                .offset(x: -160, y: -90)
                .blur(radius: 90)
            
            // 第二层圆形
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.orange.opacity(0.4), Color.pink.opacity(0.4)]), startPoint: .leading, endPoint: .bottomTrailing))
                .frame(width: 300, height: 300)
                .offset(x: 165, y: -120)
                .blur(radius: 60)
            
            // 第三层圆形
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.yellow.opacity(0.4), Color.green.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 280, height: 280)
                .offset(x: 60, y: 200)
                .blur(radius: 75)
            
            
            VStack{
                Text("Comparison")
                    .font(.largeTitle)
                    .bold()
                TextField("Input the 1st num", text: $Num1)
                    .frame(width: 200)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Input the 2nd num", text: $Num2)
                    .frame(width: 200)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Spacer().frame(height: 40)
                
                HStack(spacing: 15) {
                    Button(action: { compare(operation: "<") }) {
                        comparisonButtonLabel("<")
                    }
                    Button(action: { compare(operation: ">") }) {
                        comparisonButtonLabel(">")
                    }
                    Button(action: { compare(operation: "==") }) {
                        comparisonButtonLabel("==")
                    }
                }
                HStack(spacing: 15) {
                    Button(action: { compare(operation: "<=") }) {
                        comparisonButtonLabel("≤")
                    }
                    Button(action: { compare(operation: ">=") }) {
                        comparisonButtonLabel("≥")
                    }
                    Button(action: { compare(operation: "≠") }) {
                        comparisonButtonLabel("≠")
                    }
                }
                
                Spacer().frame(height: 50)
                Text("Result:\(result)")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                
                Spacer().frame(height: 50)
                
                // 显示结果
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.title2)
                        .padding()
                } else if !resultMessage.isEmpty {
                    Text(resultMessage)
                        .font(.title2)
                        .foregroundColor(.purple)
                        .padding()
                } else {
                    Text("Result will appear here")
                        .foregroundColor(.gray)
                        .padding()
                }
                
                Spacer()
            }
        }
        .padding()
    }
    
    // 比较逻辑
    func compare(operation: String) {
        // 验证输入
        guard let num1 = Double(Num1), let num2 = Double(Num2) else {
            errorMessage = "Please enter valid numbers"
            resultMessage = ""
            return
        }
        
        errorMessage = "" // 清空错误信息
        switch operation {
        case "<":
            resultMessage = "\(num1) < \(num2) is \(num1 < num2)"
        case ">":
            resultMessage = "\(num1) > \(num2) is \(num1 > num2)"
        case "==":
            resultMessage = "\(num1) == \(num2) is \(num1 == num2)"
        case "<=":
            resultMessage = "\(num1) ≤ \(num2) is \(num1 <= num2)"
        case ">=":
            resultMessage = "\(num1) ≥ \(num2) is \(num1 >= num2)"
        case "≠":
            resultMessage = "\(num1) ≠ \(num2) is \(num1 != num2)"
        default:
            errorMessage = "Invalid operation"
            resultMessage = ""
        }
    }
    
    // 按钮样式
    func comparisonButtonLabel(_ symbol: String) -> some View {
        Text(symbol)
            .font(.title)
            .frame(width: 60, height: 60)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
            .shadow(radius: 5)
    }
}

#Preview {
    ComparisonView()
}
