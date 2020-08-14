//
//  SendMail.swift
//  Pusher
//
//  Created by 奚锐的Mac on 2020/6/13.
//  Copyright © 2020 奚锐的Mac. All rights reserved.
//

import SwiftUI

struct SendMail: View {
    
    @State var NTitle : String
    @State var NSecTitle : String
    @State var myswitch = true
    var body: some View {
        
        EditNewEventView( NTitle: NTitle, NSecTitle: NSecTitle,TabText: "事件",ImageName: "calendar",startTime: Date(), endTime: Date())
        
        
    }
}

struct SendMail_Previews: PreviewProvider {
    static var previews: some View {
        SendMail(NTitle: "",NSecTitle: "")
    }
}

struct EditNewEventView: View {
    @Environment(\.presentationMode) var presentation
    @State var NTitle : String
    @State var NSecTitle : String
    @State var TabText : String
    @State var ImageName : String
    @State  var selectedChanel = 0
    @State var dayandnight = 0
    @State var startTime :Date
    @State var endTime :Date
    let mydateFormate: ()->DateFormatter = {var a = DateFormatter();a.dateFormat = "MM/dd/yyyy HH:mm";return a }
    @State var TimeCorrect = false
    
    let daysegment :[String] = ["上","下"]
    var body: some View {
        VStack {
            Rectangle()
                .frame(width:50,height:6)
                .cornerRadius(3)
                .padding(.top)
            VStack(alignment: .trailing){
                
                HStack{
                    Text(self.TabText)
                        .font(.title)
                        
                    Spacer()
                    
                    Button(action:{self.presentation.wrappedValue.dismiss()}){
                        Image(systemName: "arrow.up")
                            .resizable().padding(.all,5).background(Circle().fill(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))).frame(width:40,height: 40).shadow(radius: 3))
                            .frame(width:30,height: 30)
                    }.padding(.trailing)
                }.padding(.horizontal)
            }
            ScrollView {
                VStack(alignment: .leading, spacing: 21.0){
                    
                    Text("")
                    InfoTextItem(bindingString: $NTitle, text: "标题")
                    InfoTextItem(bindingString: $NSecTitle, text: "地点")
                    TimeChooser(text: "开始",  selectTime: self.$startTime, avliableDate:  false)
                    TimeChooser(text: "结束",  selectTime: self.$endTime, avliableDate: false )
                    PickChannel(selectedChanel: self.$selectedChanel).background(RoundedRectangle(cornerRadius: 15).fill(Color.white).opacity(0.5).shadow(radius: 4))
                        .frame(height: 300.0)
                    
                }.padding(.horizontal)
            }.background(RoundedRectangle(cornerRadius: 25).fill(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))).blendMode(.difference).padding(.horizontal,4).shadow(radius: 20)).overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))).padding(.horizontal,4))
            
        }.animation(.easeInOut)
        
    }
}

struct PickChannel: View {
    @Binding var selectedChanel : Int
    var body: some View {
        VStack {
            HStack {
                Text("通知目的地").bold()
                Spacer()
            }
                
            .padding([.top, .leading])
            Divider()
            ScrollView{
                VStack(spacing: 1.0) {
                    PickChannelItem(text: "电院通知群")
                    PickChannelItem(text: "年级通知群")
                    PickChannelItem(text: "入党积极分子通知群")
                    PickChannelItem(text: "计算机院通知群")
                    PickChannelItem(text: "校团委通知群")
                    PickChannelItem(text: "黄叔郎公鸡煲")
                    PickChannelItem(text: "张暗麻辣烫")
                    PickChannelItem(text: "21#306大家庭")
                    PickChannelItem(text: "爱你的科技协会")
                    PickChannelItem(text: "青春校园")
                  
                    
                }
                
                
                
            }
            
            
        }
    }
}

struct InfoTextItem: View {
    @Binding var bindingString:String
    @State var text:String
    var body: some View {
        TextField(text, text: $bindingString).accentColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
            .font(.body).padding(.all,10).background(RoundedRectangle(cornerRadius: 8).fill(Color.white).opacity(0.5)).shadow(radius: 4)
    }
}

struct TimeChooser: View {
    @State var text : String
    @Binding var selectTime :Date
    @State var showPicker = false
    @State var avliableDate : Bool

    let mydateFormate: ()->DateFormatter = {var a = DateFormatter();a.dateFormat = "MM/dd/yyyy HH:mm";return a }
    var body: some View {
        VStack {
            HStack {
                Text("\(self.text): ").foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                Text("\(self.mydateFormate().string(from:self.selectTime))").strikethrough(self.avliableDate,color: Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))).onTapGesture {
                    self.showPicker.toggle()
                
                }
                Spacer()
            }.padding(.all,10)
            if(showPicker){
                Divider()
                HStack{
                    DatePicker("", selection: $selectTime)
                }
            }
            
            
        }.background(RoundedRectangle(cornerRadius: 8).fill(Color.white).shadow(radius: 3).opacity(0.5)).animation(.spring())
    }
}


struct PickChannelItem: View {
    @State var text : String
    var body: some View {
        HStack{
            CheckBox(CheckState: false)
                .frame(width: 20.0, height: 20.0).padding()
            Spacer()
            Text("\(self.text)")
            Spacer()
        }
    }
}
extension EditNewEventView{
    //return true if date2 is earlier
   public static func MyDateCompare(time1:Date,time2:Date )->Bool{
        if time1.compare(time2) == .orderedDescending
    {
        print(">")
        return false//1>2
    }
    else{
            print("<")
    return true
    }
   
}
}
