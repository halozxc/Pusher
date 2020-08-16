//
//  ReceiveSchedule.swift
//  Pusher
//
//  Created by 奚锐的Mac on 2020/6/11.
//  Copyright © 2020 奚锐的Mac. All rights reserved.
//

import SwiftUI

struct ReceiveSchedule: View {
    @State var schedule : [Bool] = [false,false,false,false,false,false,false ,false,false,false,false,false,false,false,false,false,false,false,false ,false,false,false,false ,false,false]
    @State var Selected = 0
    @State var dayandnight = 0
    @State var angle : Double = 0
    public static let ScreenBounds = UIScreen.main.bounds
     let daysegment :[String] = ["上","下"]
    
    var body: some View {
  
        ZStack {
           
            VStack(spacing: 21.0) {
             
                ZStack {
                    //ClockBounds()
                    Image("dial").resizable().scaledToFit().padding(.all,35).shadow(radius: 10)
                    
                    ZStack {
                        Capsule().offset(x:0,y:-40).rotationEffect(Angle(degrees: self.angle)).shadow(radius: 3)
                        Capsule().fill(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))).frame(width:3,height:20).offset(x:0,y:-69).rotationEffect(Angle(degrees: self.angle))
                        Circle().fill(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))).overlay(Circle().stroke(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)),lineWidth: 2))
                    }.frame(width:9,height:87).animation(.easeOut)
                    ForEach(1..<13){count in
                        
                        
                        ZStack{
                            
                            Text("\(count)").foregroundColor(self.schedule[count+12*self.dayandnight] ? Color(#colorLiteral(red: 0.4431372549, green: 0.3921568627, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))).bold( ).scaleEffect(self.schedule[count+12*self.dayandnight] ? 1.5 : 1).animation(.spring())
                        
                        }.onTapGesture {
                            self.schedule[count+12*self.dayandnight].toggle();
                            self.angle = Double(count )*30.0
                            }
                        
                        .multilineTextAlignment(.center).frame(width: 45.0, height: 45.0).offset(x:CalClockOffset.GetOffset(time: count, Scale:0.32*ReceiveSchedule.ScreenBounds.width).y,y:-CalClockOffset.GetOffset(time: count,Scale:0.32*ReceiveSchedule.ScreenBounds.width).x)
                        
                    }
                    
                }
                HStack{
                                
                                 Picker( "选择时间",selection:self.$dayandnight){
                                     ForEach(0..<2){count in
                                         Text("\(self.daysegment[count])午")
                                 
                                     }
                                 }.padding(.horizontal,100).pickerStyle(SegmentedPickerStyle())
                             }
            }
                
            .frame(height: 500.0)
        }.navigationBarTitle("设定时间点")
       
        
        
    }
}

struct ReceiveSchedule_Previews: PreviewProvider {
    static var previews: some View {
        ReceiveSchedule()
    }
}


class CalClockOffset{
    
    private static func CalOffset(time:Int,Scale:CGFloat)->CGPoint{
        let x = Scale*cos(CGFloat(CGFloat(Float(time)/6)*CGFloat.pi))
        let y = Scale*sin(CGFloat(Float(time)/6)*CGFloat.pi)
        print(y)
        return CGPoint(x:x,y:y)
    }
    public static func GetOffset(time:Int,Scale:CGFloat)->CGPoint{
        
        return CalClockOffset.CalOffset(time: time, Scale: 0.97*Scale)
        if(time%2 == 1){
            let a = CalClockOffset.CalOffset(time: time-1, Scale: Scale)
            let b = CalClockOffset.CalOffset(time: time+1, Scale: Scale)
            let c = CGPoint(x:0.5*(a.x+b.x),y:0.5*(a.y+b.y))
            return c
        }
        else{
            return CalClockOffset.CalOffset(time: time, Scale: 0.97*Scale)
        }
    }
}

struct ClockBounds: View {
    @State var appear = false
    var body: some View {
        ZStack {
            HexagonParametersView(gradientStart: Color("HexagonBegin"), gradientEnd: Color("HexagonBegin")).frame(width: UIScreen.self.main.bounds.width , height:  UIScreen.self.main.bounds.width ).opacity(0.9).blendMode(.darken).scaleEffect(self.appear ? 1 :0).rotationEffect(Angle(degrees: self.appear ? 0 : 45)).animation(.easeIn).onAppear(){
                self.appear = true
            }
            HexagonParametersView(gradientStart: Color.white, gradientEnd: Color.white).scaleEffect(0.65).shadow(radius: 3).scaleEffect(self.appear ? 1 :0).rotationEffect(Angle(degrees: self.appear ? 0 : 45)).animation(.easeIn).onAppear(){
                self.appear = true
            }
            semicircle().fill(Color.white).frame(width: 70.0, height: 70.0).rotationEffect(Angle(degrees: 33)).offset(x:0.32*ReceiveSchedule.ScreenBounds.width,y: -0.32*ReceiveSchedule.ScreenBounds.width).shadow(radius: 2)
            
            semicircle().fill(Color.white).frame(width: 70.0, height: 70.0).rotationEffect(Angle(degrees: -33)).offset(x:-0.32*ReceiveSchedule.ScreenBounds.width,y: -0.32*ReceiveSchedule.ScreenBounds.width).shadow(radius: 2)
            Capsule().fill(Color.white).frame(width: 10.0, height: 50.0).rotationEffect(Angle(degrees: 45)).offset(x:-0.2*ReceiveSchedule.ScreenBounds.width,y: 0.47*ReceiveSchedule.ScreenBounds.width).shadow(radius: 2)
             Capsule().fill(Color.white).frame(width: 10.0, height: 50.0).rotationEffect(Angle(degrees: -45)).offset(x:0.2*ReceiveSchedule.ScreenBounds.width,y: 0.47*ReceiveSchedule.ScreenBounds.width).shadow(radius: 2)
            Image(systemName: "alarm").foregroundColor(Color.gray).font(.largeTitle)
            
        }
    }
}
