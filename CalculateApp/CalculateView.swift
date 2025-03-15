//
//  CalculateView.swift
//  CalculateApp
//
//  Created by たお1219 on 2024/11/26.
//



import SwiftUI
import UIKit

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        view.backgroundColor = .clear // 设置背景为透明
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
        uiView.backgroundColor = .clear // 确保背景始终透明
    }
}


struct CalculateView: View {
    @State private var inputNum1: String = ""
    @State private var inputNum2: String = ""
    @State private var result: String = ""
    @State private var equation: String = ""
    @State private var errorMessage: String = ""
    
    var body: some View {
        ZStack {
            // 背景圆形和渐变色
            Color.white.ignoresSafeArea()
            
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]), startPoint: .top, endPoint: .bottom))
                .frame(width: 250, height: 300)
                .offset(x: -150, y: 100)
                .blur(radius: 50)
                .opacity(0.6)
            
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .top, endPoint: .bottom))
                .frame(width: 300, height: 300)
                .offset(x: 150, y: -100)
                .blur(radius: 50)
                .opacity(0.8)
            
            VStack {
                Text("Calculator")
                    .font(.largeTitle)
                    .bold()
                
                
                TextField("Input the 1st number", text: $inputNum1)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Input the 2nd number", text: $inputNum2)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Spacer().frame(height: 60)
                
                HStack {
                    operationButton("+")
                    operationButton("-")
                    operationButton("×")
                }
                
                HStack {
                    operationButton("÷")
                    operationButton("%")
                    operationButton("C")
                }
                
                Spacer().frame(height: 100)
                
                
                Text("Result:")
                    .font(.title)
                    .bold()
                
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .font(.title2)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    Text(equation)
                        .font(.title2)
                        .foregroundColor(.purple)
                        .padding()
                }
            }
            .padding()
        }
    }
    

    func operationButton(_ symbol: String) -> some View {
        Button(action: { calculate(operation: symbol) }) {
            Text(symbol)
                .font(.largeTitle)
                .frame(width: 60, height: 60)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
                .shadow(radius: 5)
        }
    }
    

    func calculate(operation: String) {
        guard let num1 = Double(inputNum1), let num2 = Double(inputNum2) else {
            errorMessage = "Invalid numbers. Please enter valid numbers."
            equation = ""
            result = ""
            return
        }
        
        errorMessage = ""
        switch operation {
        case "+":
            let calcResult = num1 + num2
            equation = "\(num1) + \(num2) = \(String(format: "%.2f", calcResult))"
        case "-":
            let calcResult = num1 - num2
            equation = "\(num1) - \(num2) = \(String(format: "%.2f", calcResult))"
        case "×":
            let calcResult = num1 * num2
            equation = "\(num1) × \(num2) = \(String(format: "%.2f", calcResult))"
        case "÷":
            if num2 == 0 {
                errorMessage = "Cannot divide by zero."
                equation = ""
                result = ""
            } else {
                let calcResult = num1 / num2
                equation = "\(num1) ÷ \(num2) = \(String(format: "%.2f", calcResult))"
            }
        case "%":
            let calcResult = num1.truncatingRemainder(dividingBy: num2)
            equation = "\(num1) % \(num2) = \(String(format: "%.2f", calcResult))"
        case "re":
            equation = ""
            result = ""
            inputNum1 = ""
            inputNum2 = ""
    
        default:
            errorMessage = "Unknown operation."
            equation = ""
            result = ""
        }
    }
}

#Preview {
    CalculateView()
}
