//
//  View.swift
//  CalculateApp
//
//  Created by たお1219 on 2024/11/26.
//

import SwiftUI
import UIKit

struct blurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.backgroundColor = UIColor(white: 1.0, alpha: 0.1) // 设置透明背景层，透明度更高
        return blurView
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        let blurEffect = UIBlurEffect(style: style)
        uiView.effect = blurEffect
        uiView.backgroundColor = UIColor(white: 1.0, alpha: 0.1) // 确保背景始终透明
    }
}

struct JudgementView: View {
    @State private var inputAge : String = ""
    @State private var isMember: Bool = false
    @State private var isFirsttime: Bool = false
    @State private var result: String = ""
    var body: some View {
        ZStack {
            // 背景渐变色
            LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.3), Color.blue.opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("割引判定")
                    .font(.largeTitle)
                    .bold()
                TextField("Input your age", text: $inputAge)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Toggle("会員ですか？", isOn: $isMember)
                    .frame(width: 350)
                Toggle("first time？", isOn: $isFirsttime)
                    .frame(width: 350)
                
                
                Spacer().frame(height: 50)
                Text("Result:\(result)")
                    .font(.title2)
                
                Button{
                    judgeDiscount()
                }label: {
                    Text("判定結果")
                        .font(.title)
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 80,height: 80)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                
            }
        }
    }
    
    func judgeDiscount(){
        guard let userAge = Int(inputAge) else {
            result = "error"
            return
        }
        if userAge >= 18 && isMember {
            result = "ok"
        } else {
            result = "no"
        }
        
        if isFirsttime {
            result = "ok"
        }
        
        if userAge < 18 || userAge >= 65 {
            result = "ok"
        }
    
    }
}

#Preview {
    JudgementView()
}
