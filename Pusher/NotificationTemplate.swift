//
//  NotificationTemplate.swift
//  Pusher
//
//  Created by 奚锐的Mac on 2020/8/9.
//  Copyright © 2020 奚锐的Mac. All rights reserved.
//

import SwiftUI

struct NotificationTemplate: View {
    @State var text:String
    @State var Imagetext:String
    @State var BackColor:Color
    @State var introduction : String
    var body: some View {
        VStack {
            HStack {
                Text(self.text).font(.largeTitle).foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                Spacer()
            }
            .padding([.top, .leading])
            HStack{
                Text(self.introduction).foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                    .multilineTextAlignment(.leading)
                    .lineLimit(4)
                    
                    .padding(.leading)
                Spacer()
                
                Image(self.Imagetext).resizable().frame(width: 75.0, height: 75.0).aspectRatio(contentMode: .fit)
                
            }
            .padding([.bottom, .trailing])
        }.background(RoundedRectangle(cornerRadius: 20).fill(self.BackColor).shadow(radius: 10).opacity(0.4))
    }
}

struct NotificationTemplate_Previews: PreviewProvider {
    static var previews: some View {
        NotificationTemplate(text:"标题", Imagetext: "Active1",BackColor: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)),introduction: "对未来日程的安排，可与系统日历联动")
    }
}
