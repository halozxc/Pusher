//
//  NotificationTemplateAndData.swift
//  Pusher
//
//  Created by 奚锐的Mac on 2020/8/11.
//  Copyright © 2020 奚锐的Mac. All rights reserved.
//

import Foundation
enum NotificationContentMode : Int{
    case Event = 0
    case Task = 1
    case Tip = 2
}
 class ChannelList :ObservableObject,Identifiable{
    var id: UUID = UUID()
    var sender : String = ""
    var portrait : String = ""
    @Published var notifications : DetailItemList
    init(sender:String,potrait:String,notifications:[DetailItem]) {
        self.sender = sender
        self.portrait = potrait
        self.notifications = DetailItemList(items: notifications)
    }
    func getNum(mode : NotificationContentMode) ->Int{
        let temp =  notifications.items.filter { (item) -> Bool in
            item.mode == mode
        }
        return temp.count
    }
  
}
class DetailItemList :Identifiable, ObservableObject{
      @Published var items : [DetailItem] = []
      init(items : [DetailItem]) {
          self.items = items
      }
  }
class DetailItem :Identifiable, ObservableObject{
    var id: UUID = UUID()
   @Published var mode : NotificationContentMode
   @Published var Content : [String]
    init(mode : NotificationContentMode , Content : [String]) {
        self.mode = mode
        self.Content = Content
    }
}
