//
//  DetailGallery.swift
//  Pusher
//
//  Created by 奚锐的Mac on 2020/8/9.
//  Copyright © 2020 奚锐的Mac. All rights reserved.
//

import SwiftUI

struct DetailGallery: View {
    @State var itemList : [DetailItem]
    @State var Title:String
 
    var body: some View {
        ScrollView {
            VStack(spacing: 20.0) {
                ForEach(self.itemList){value in
                    if(value.mode == NotificationContentMode.Event){
                        GalleryEventItem(info: value.Content)
                    }
                    if(value.mode == NotificationContentMode.Task){
                        GalleryTaskItem(info: value.Content)
                    }
                    if(value.mode == NotificationContentMode.Tip){
                        GalleryTipItem(info: value.Content)
                    }
                }
            
            }.navigationBarTitle(self.Title)
    }
}
}
struct DetailGallery_Previews: PreviewProvider {
    static var previews: some View {
        DetailGallery(itemList:  [DetailItem(mode: .Event, Content: ["前往开会","2020/10/24","萧山机场"])
            ,DetailItem(mode: .Task, Content: ["请完善健康上报","2020/8/2","www.wjx.com","请尽快完成"])
            ,DetailItem(mode: .Event, Content: ["简短会议","2020/8/2","201室"])
            ,DetailItem(mode: .Tip, Content: ["今日有人生日哦","2020/8/2","www.wjx.com","请尽快完成"])
        ], Title: "事业部")
    }
}

struct GalleryEventItem: View {
      @State var info : [String]
    var body: some View {
        VStack {
            GalleryEventMenu()
            GalleryEventInfo(info : self.info)
        }.background(RoundedRectangle(cornerRadius: 25).fill(Color.white).opacity(0.5).shadow(radius: 4).overlay(RoundedRectangle(cornerRadius: 25).stroke(Color("NameLabelGradientEnd"),lineWidth: 2))).padding(.horizontal)
    }
}
struct GalleryTaskItem: View {
      @State var info : [String]
    var body: some View {
        VStack {
            GalleryTaskMenu()
            GalleryTaskInfo(info: self.info)
        }.background(RoundedRectangle(cornerRadius: 25).fill(Color.white).opacity(0.5).shadow(radius: 4).overlay(RoundedRectangle(cornerRadius: 25).stroke(Color("NameLabelGradientEnd"),lineWidth: 2))).padding(.horizontal)
    }
}
struct GalleryTipItem: View {
      
    @State var info : [String]
    var body: some View {
        VStack {
            GalleryTipMenu()
            GalleryTipInfo(info: self.info)
        }.background(RoundedRectangle(cornerRadius: 25).fill(Color.white).opacity(0.5).shadow(radius: 4).overlay(RoundedRectangle(cornerRadius: 25).stroke(Color("NameLabelGradientEnd"),lineWidth: 2))).padding(.horizontal)
    }
}

struct GalleryEventMenu: View {
   let width : CGFloat =  30.0
   let height : CGFloat =  30.0
    var body: some View {
        HStack(spacing: 27.0){
            Image(systemName: "calendar").font(.title).foregroundColor(.blue)
            Spacer()
            Button(action: {}){
                Image(systemName: "mappin").font(.body).background(Circle().fill(Color.white).frame(width: self.width, height: self.height).shadow(radius: 3))
            }.padding(.horizontal,5)
            Button(action: {}){
                Image(systemName: "calendar").font(.body).background(Circle().fill(Color.white).frame(width: self.width, height: self.height).shadow(radius: 3))
            }.padding(.horizontal,3)
            Button(action: {}){
                Image(systemName: "trash").font(.body).background(Circle().fill(Color.white).frame(width: self.width, height: self.height).shadow(radius: 3))
            }.padding(.trailing,5)
        }
        .padding([.top, .leading, .trailing],25)
    }
}

struct GalleryEventInfo: View {
    
    @State var info : [String]
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                
                Text(info.count > 0 ? info[0] : "").font(.title).bold().multilineTextAlignment(.leading)
                Text("时间：\(info.count > 1 ? info[1] : "")").font(.caption).multilineTextAlignment(.leading)
                Text("地点：\(info.count > 2 ? info[2] : "")").font(.caption).multilineTextAlignment(.leading)
            }
            
            Spacer()
        }
        .padding([.leading, .bottom, .trailing],25)
    }
}
struct GalleryTaskMenu: View {
    let width : CGFloat =  30.0
    let height : CGFloat =  30.0
    var body: some View {
        HStack(spacing: 27.0){
            Image(systemName: "hammer").font(.title).foregroundColor(.blue)
            Spacer()
            Button(action: {}){
                Image(systemName: "mappin").font(.body).background(Circle().fill(Color.white).frame(width: self.width, height: self.height).shadow(radius: 3))
            }.padding(.horizontal,5)
            Button(action: {}){
                Image(systemName: "location.fill").font(.body).background(Circle().fill(Color.white).frame(width: self.width, height: self.height).shadow(radius: 3))
            }.padding(.horizontal,3)
            Button(action: {}){
                Image(systemName: "trash").font(.body).background(Circle().fill(Color.white).frame(width: self.width, height: self.height).shadow(radius: 3))
            }.padding(.trailing,5)
        }
        .padding([.top, .leading, .trailing],25)
    }
}
struct GalleryTaskInfo: View {
    @State var info : [String]
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(info.count > 0 ? info[0] : "").font(.body).bold().multilineTextAlignment(.leading)
                Text("时间：\(info.count > 1 ? info[1] : "")").font(.caption).multilineTextAlignment(.leading)
                Text("url：\(info.count > 2 ? info[2] : "")").font(.caption).multilineTextAlignment(.leading)
                Text("备注：\(info.count > 3 ? info[3] : "")").font(.caption).multilineTextAlignment(.leading)
            }
            
            Spacer()
        }
        .padding([.leading, .bottom, .trailing],25)
    }
}
struct GalleryTipMenu: View {
    let width : CGFloat =  30.0
    let height : CGFloat =  30.0
    var body: some View {
        HStack(spacing: 20.0){
            Image(systemName: "lightbulb").frame(width: self.width, height: self.height).font(.title).foregroundColor(.blue)
            Spacer()
            Button(action: {}){
                Image(systemName: "heart").frame(width: self.width, height: self.height).font(.body).background(Circle().fill(Color.white).frame(width: self.width, height: self.height).shadow(radius: 3))
            }.padding(.horizontal,3)
          
            Button(action: {}){
                Image(systemName: "trash").frame(width: self.width, height: self.height).font(.body).background(Circle().fill(Color.white).frame(width: self.width, height: self.height).shadow(radius: 3))
            }.padding(.trailing,5)
        }
        .padding([.top, .leading, .trailing],25)
    }
}
struct GalleryTipInfo: View {
      @State var info : [String]
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                
                Text("\(info.count > 0 ? info[0] : "")").font(.title).bold().multilineTextAlignment(.leading)
                
            }
            
            Spacer()
        }
        .padding([.leading, .bottom, .trailing],25)
    }
}

