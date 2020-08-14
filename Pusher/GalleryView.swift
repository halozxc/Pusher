//
//  GalleryView.swift
//  Pusher
//
//  Created by 奚锐的Mac on 2020/6/11.
//  Copyright © 2020 奚锐的Mac. All rights reserved.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        ScrollView(.vertical,showsIndicators: true) {
            VStack(spacing:0) {
                
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing: 40.0) {
                        ForEach(0..<3){
                            value in
                            GeometryReader { geo in
                                EventItem(backGroundColor: Color("CalendarGalaryBackGround"),Title:"事件",SecondTitle: "地点",Content: "时间")
                                    
                                    .padding([.top, .leading, .bottom], 20.0)
                                    .rotation3DEffect(Angle(degrees: Double(geo.frame(in:.global).minX)/20), axis: (x:0,y:10,z:0))
                            }.frame(width :300,height: 240)
                            
                            
                        }
                        
                    }
                }
                ScrollView(.horizontal,showsIndicators: false){
                                 HStack(spacing: 40.0) {
                                     ForEach(0..<3){
                                         value in
                                         GeometryReader { geo in
                                             OperationItem(backGroundColor: Color("OperationBackground"),Title:"操作",SecondTitle: "链接",Content: "备注")
                                                 
                                                 .padding([.top, .leading, .bottom], 20.0)
                                                 .rotation3DEffect(Angle(degrees: Double(geo.frame(in:.global).minX)/20), axis: (x:0,y:10,z:0))
                                         }.frame(width :300,height: 240)
                                         
                                         
                                     }
                                     
                                 }
                             }
                ScrollView(.horizontal,showsIndicators: false){
                                 HStack(spacing: 40.0) {
                                     ForEach(0..<3){
                                         value in
                                         GeometryReader { geo in
                                             TipItem(backGroundColor: Color("TipBackGround"),Title:"提示",Content: "内容")
                                                 
                                                 .padding([.top, .leading, .bottom], 20.0)
                                                 .rotation3DEffect(Angle(degrees: Double(geo.frame(in:.global).minX)/20), axis: (x:0,y:10,z:0))
                                         }.frame(width :300,height: 240)
                                         
                                         
                                     }
                                     
                                 }
                             }
                
                
                
                
                
            }.navigationBarTitle(Text("detail"))
            
            
            
        }
    }
    
    struct GalleryView_Previews: PreviewProvider {
        static var previews: some View {
            GalleryView()
        }
    }
    
    struct EventItem: View {
        @State var finishAlert = false
        @State var backGroundColor : Color
        @State var Title : String!
        @State var SecondTitle : String!
        @State var Content : String!
        
        var body: some View {
            ZStack {
                VStack(alignment: .leading, spacing: 10.0) {
                    HStack {
                        Image(systemName: "calendar")
                            .font(.title)
                            .foregroundColor(.white)
                        Text(self.Title)
                            .font(.title)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                        Spacer()
                        
                    }.padding([.top, .leading, .trailing], 15.0)
                    Text(self.SecondTitle)
                        .foregroundColor(.white )
                        .padding(.horizontal)
                    Text(self.Content)
                        .foregroundColor(.white )
                        .padding(.horizontal)
                    
                    Spacer()
                }
            
                .background(self.backGroundColor)
                .cornerRadius(20)
                .shadow(radius: 5)
                .frame(width:300,height:150)
                VStack {
                    Spacer()
                    HStack(spacing:10.0){
                        Spacer()
                        Button(action: {
                            self.finishAlert = true
                            
                        })
                        {
                            Image(systemName: "command")
                                .frame(width:12,height:12)
                                .padding(.all)
                            
                        }
                        .background(Color("AcceptButton"))
                        .cornerRadius(20)
                        .alert(isPresented:self.$finishAlert){
                            Alert(title: Text("已添加到日历中"), message: Text("Message"), dismissButton: .default(Text("dismiss")))
                        }
                        
                        
                        Button(action: {}) {
                            Image(systemName: "trash")
                                .frame(width:12,height:12)
                                .padding(.all)
                        }
                           .background(Color("RejectButtonBackground"))
                        .cornerRadius(20)
                        
                        
                    }.offset(x:0,y:0)
                    
                    
                    
                    
                }
                
            }
            
        }
    }
    
    
    struct OperationItem: View {
        @State var finishAlert = false
        @State var backGroundColor : Color
        @State var Title : String!
        @State var SecondTitle : String!
        @State var Content : String!
        
        var body: some View {
            ZStack {
                VStack(alignment: .leading, spacing: 10.0) {
                    HStack {
                        Image(systemName: "calendar")
                            .font(.title)
                            .foregroundColor(.white)
                        Text(self.Title)
                            .font(.title)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                        Spacer()
                        
                    }.padding([.top, .leading, .trailing], 15.0)
                    Text(self.SecondTitle)
                        .foregroundColor(.white )
                        .padding(.horizontal)
                    Text(self.Content)
                        .foregroundColor(.white )
                        .padding(.horizontal)
                    
                    Spacer()
                }
                .background(self.backGroundColor)
                .cornerRadius(20)
                .shadow(radius: 5)
                .frame(width:300,height:150)
                VStack {
                    Spacer()
                    HStack(spacing:10.0){
                        Spacer()
                        Button(action: {
                            self.finishAlert = true
                            
                        })
                        {
                            Image(systemName: "airplane")
                                .frame(width:12,height:12)
                                .padding(.all)
                            
                        }
                           .background(Color("AcceptButton"))
                        .cornerRadius(20)
                        .alert(isPresented:self.$finishAlert){
                            Alert(title: Text("正在跳转到网站"), message: Text("即将前往目标应用"), dismissButton: .default(Text("好的")))
                        }
                        
                        
                        Button(action: {}) {
                            Image(systemName: "trash")
                                .frame(width:12,height:12)
                                .padding(.all)
                        }
                          .background(Color("RejectButtonBackground"))
                        .cornerRadius(20)
                        
                        
                    }.offset(x:0,y:0)
                    
                    
                    
                    
                }
                
            }
            
        }
    }
}
 struct TipItem: View {
        @State var finishAlert = false
        @State var backGroundColor : Color
        @State var Title : String!
        
        @State var Content : String!
        
        var body: some View {
            ZStack {
                VStack(alignment: .leading, spacing: 10.0) {
                    HStack {
                        Image(systemName: "calendar")
                            .font(.title)
                            .foregroundColor(.white)
                        Text(self.Title)
                            .font(.title)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                        Spacer()
                        
                    }.padding([.top, .leading, .trailing], 15.0)
                  
                    Text(self.Content)
                        .foregroundColor(.white )
                        .padding(.horizontal)
                    
                    Spacer()
                }
                .background(self.backGroundColor)
                .cornerRadius(20)
                .shadow(radius: 5)
                .frame(width:300,height:150)
                VStack {
                    Spacer()
                    HStack(spacing:10.0){
                        Spacer()
                        Button(action: {
                            self.finishAlert = true
                            
                        })
                        {
                            Image(systemName: "heart")
                                .frame(width:12,height:12)
                                .padding(.all)
                                .foregroundColor(Color.red)
                            
                        }
                           .background(Color("AcceptButton"))
                        .cornerRadius(20)
                        .alert(isPresented:self.$finishAlert){
                            Alert(title: Text("正在跳转到网站"), message: Text("即将前往目标应用"), dismissButton: .default(Text("好的")))
                        }
                        
                        
                        Button(action: {}) {
                            Image(systemName: "trash")
                                .frame(width:12,height:12)
                                .padding(.all)
                       
                        }
                        .background(Color("RejectButtonBackground"))
                        .cornerRadius(20)
                        
                        
                    }.offset(x:0,y:0)
                    
                    
                    
                    
                }
                
            }
            
        }
    }


