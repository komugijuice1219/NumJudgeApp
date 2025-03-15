//
//  greetingView.swift
//  CalculateApp
//
//  Created by たお1219 on 2024/11/27.
//

import SwiftUI

struct greetingView: View {
    @State private var currentTime: String = "" // 用于存储当前时间
    @State private var customTime: String = "" // 用户输入的时间
    @State private var greetingMessage = "greeting words"
    @State private var morningColor = Color.mint // 早上的背景色
    @State private var dayColor = Color.teal // 白天的背景色
    @State private var nightColor = Color.gray // 晚上的背景色
    @State private var backgroundColor = Color.white // 背景颜色
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() // 使用 Timer 创建一个每秒触发的定时器。
    var body: some View {
        ZStack{
            backgroundColor // 背景颜色
                .ignoresSafeArea()
            
            //            VStack{
            
            
            
            VStack {
                Text("Greeting\nApplication")
                    .font(.largeTitle)
                    .bold()
                HStack{
                    Text("現在時刻：\n\(currentTime)")
                        .bold()
                        .padding(.leading)
                        .onReceive(timer) { _ in
                            updateTime() // 定时更新当前时间
                            
                        }.onAppear {
                            updateTime() // 视图加载时立即获取当前时间
                        }
                    Spacer()
                }
                
                Text(greetingMessage)
                    .font(.largeTitle)
                    .padding()
                    .frame(width: 350,height: 150)
                
                HStack{
                    TextField("input time", text: $customTime)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .frame(width: 150)
                    
                    Button(action: {
                        inputTime()
                    }){Text("input")
                            .padding()
                            .frame(height: 35)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                }
                
                
                
                Button(action: {
                    greetCurrentTime()
                }){Text("greeting now")
                        .font(.title3)
                        .padding()
                        .frame(height: 45)
                        .frame(width: 170)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                
                
                VStack(spacing: 10) {
                    Text("背景色の設定")
                        .font(.title3)
                    
                    //                VStack {
                    ColorPicker("朝の背景色", selection: $morningColor)
                    ColorPicker("昼の背景色", selection: $dayColor)
                    ColorPicker("夜の背景色", selection: $nightColor)
                    //                }
                }
                .padding()
                
                //        }
            }
        }
        
    }
    
    
    
    
    func updateTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        currentTime = formatter.string(from: Date())
    }
    
    
    //    func message(for hour: Int) {
    //        switch hour {
    //        case 6..<12:
    //            greetingMessage = "おはようございます"
    //            backgroundColor = morningColor
    //        case 12..<18:
    //            greetingMessage = "こんにちは"
    //            backgroundColor = dayColor
    //        case 18..<24, 0..<6:
    //            greetingMessage = "こんばんは"
    //            backgroundColor = nightColor
    //        default:
    //            greetingMessage = "時間外です"
    //        }
    //    }
    
    func inputTime() {
        guard let hour = Int(customTime), (0...23).contains(hour) else {
            greetingMessage = "正しい時刻を入力してください"
            return
        }
        updateGreeting(for: hour)
        
    }
    
    func greetCurrentTime() {
        let hour = Calendar.current.component(.hour, from: Date())
        updateGreeting(for: hour)
    }
    
    func updateGreeting(for hour: Int) {
        switch hour {
        case 6..<12:
            greetingMessage = "おはようございます"
            backgroundColor = morningColor
        case 12..<18:
            greetingMessage = "こんにちは"
            backgroundColor = dayColor
        case 18..<24, 0..<6:
            greetingMessage = "こんばんは"
            backgroundColor = nightColor
        default:
            greetingMessage = "時間外です"
        }
    }
}

#Preview {
    greetingView()
}
