import SwiftUI
import UIKit
struct ContentView: View {
    @State var notificationCount = 6
    @State var detail = false
    @State var title = "asdas"
    @State var open  = false
    @State var ShowNewMail = false
    @State var offset :CGFloat = CGFloat.zero
    @State var onhover = false
    @State var SearchKey = ""
    @State var destKey = ""
    @State var eventTemp = false
    @State var TaskTemp = false
    @State var TipTemp = false
    @State var taskTemp = false
    @State var tipTemp = false
    @State var tabTag = 0
    @State var receivedNotifications : [ChannelList] = [
        ChannelList(sender: "运营一家庭", potrait: "portrait1", notifications: [DetailItem(mode: .Event, Content: ["前往开会","2020/10/24","萧山机场"])
            ,DetailItem(mode: .Task, Content: ["请完善健康上报","2020/8/2","www.wjx.com","请尽快完成"])
            ,DetailItem(mode: .Event, Content: ["简短会议","2020/8/2","201室"])
            ,DetailItem(mode: .Tip, Content: ["今日有人生日哦","2020/8/2","www.wjx.com","请尽快完成"])
        ]),
        ChannelList(sender: "第一研发部", potrait: "portrait2", notifications: [DetailItem(mode: .Tip, Content: ["服务器今日已修复"])
            ,DetailItem(mode: .Task, Content: ["请完善界面的开发","2020/8/5","www.github.com","注意代码规范"])
            ,DetailItem(mode: .Tip, Content: ["本办公室饮水机暂不可用"])
        ]),
        ChannelList(sender: "协会养老院", potrait: "portrait3", notifications: [
            DetailItem(mode: .Task, Content: ["年度合影快来领取吧","","www.github.com",""])
            ,DetailItem(mode: .Tip, Content: ["本办公室饮水机暂不可用"])
        ])]
    @State var sendedNotifications : DetailItemList = DetailItemList(items: [DetailItem(mode: .Event, Content: ["前往开会","2020/10/24","萧山机场"]),DetailItem(mode: .Tip, Content: ["今日有人生日哦"])])
    let tabNavigationTitle : [String] = ["最新","选择模版","已发布"]
    var body: some View {
        
        ZStack {
            NavigationView {
                TabView(selection: self.$tabTag){
                    
                    ZStack {
                        
                        VStack {
                            
                            ScrollView(){
                                
                                VStack {
                                    SearchField(SearchKey: self.$SearchKey)
                                    VStack(spacing: 15.0) {
                                        ForEach (self.receivedNotifications) {item in
                                            NavigationLink(destination: DetailGallery(itemList: item.notifications.items, Title: "\(item.sender)")){
                                                NotificationView(channel: item).padding(.top)
                                                
                                            }
                                        }
                                    }
                                }.background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)))
                                
                            }
                            
                        }
                        
                        
                        
                    }
                        
                    .tag(0).tabItem{
                        VStack {
                            Image(systemName: "message").font(.title)
                            Text("收取")
                        }
                        
                        
                    }
                    ScrollView{
                        VStack{
                            NotificationTemplate(text: "事件", Imagetext: "Active1", BackColor: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), introduction: "对未来日程的安排，可与系统日历联动").onTapGesture{
                                self.eventTemp = true
                            }.scaleEffect(self.eventTemp ? 5 : 1).opacity(self.eventTemp ? 0 : 1).animation(.spring(response: 0.1, dampingFraction: 1, blendDuration: 0.2))
                                .sheet(isPresented: $eventTemp ){
                                    SendMail(NTitle: "事件", NSecTitle: "哈哈")
                                    
                            }
                            
                            NotificationTemplate(text: "操作", Imagetext: "Active2", BackColor: Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)), introduction: "亟待解决的任务，可与浏览器联动").onTapGesture{
                                self.TaskTemp = true
                            }.scaleEffect(self.TaskTemp ? 5 : 1).opacity(self.TaskTemp ? 0 : 1).animation(.spring(response: 0.1, dampingFraction: 1, blendDuration: 0.2))
                                .sheet(isPresented: $TaskTemp ){
                                    SendMail(NTitle: "事件", NSecTitle: "哈哈")
                                    
                            }
                            NotificationTemplate(text: "提示", Imagetext: "Active3", BackColor: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)), introduction: "提醒与建议").onTapGesture{
                                self.TipTemp = true
                            }.scaleEffect(self.TipTemp ? 5 : 1).opacity(self.TipTemp ? 0 : 1).animation(.spring(response: 0.1, dampingFraction: 1, blendDuration: 0.2))
                                .sheet(isPresented: $TipTemp ){
                                    SendMail(NTitle: "事件", NSecTitle: "哈哈")
                                    
                            }
                        }.padding(.horizontal,35).background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)))
                    }
                    .tag(1).tabItem(){
                        Image(systemName: "plus").foregroundColor(Color(#colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1))).font(.title)
                        Text("新建")}
                    ScrollView{
                        VStack{
                            ForEach(self.sendedNotifications.items){value in
                                if(value.mode == NotificationContentMode.Event){
                                   EditGalleryEventItem(info: value.Content)
                                }
                                if(value.mode == NotificationContentMode.Task){
                                    EditGalleryTaskItem(info: value.Content)
                                }
                                if(value.mode == NotificationContentMode.Tip){
                                    EditGalleryTipItem(info: value.Content)
                                }
                            }
                            
                            
                        }.background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)))
                    }
                        
                    .tag(2).tabItem(){
                        Image(systemName: "pencil.and.outline").foregroundColor(Color(#colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1))).font(.title)
                        Text("编辑")
                    }
                    
                }.accentColor(Color.purple).navigationBarTitle(Text("\(self.tabNavigationTitle[self.tabTag])"),displayMode: .automatic)
                    .navigationBarItems(leading: Button(action: {}){
                        Image(systemName: "plus")
                            .font(.title)
                            .accessibility(label: Text("添加新频道"))
                        },trailing: HStack{
                            NavigationLink(destination:ReceiveSchedule()){
                                Image(systemName: "alarm")
                                    
                                    .font(.title)
                                    .frame(width:30,height:10)
                                    .accessibility(label: Text("设定收取时间点"))
                                    .accessibility(hint: Text("前往新页面以设置时间点"))
                            }.isDetailLink(true)
                            NavigationLink(destination:ReceiveSchedule() ){
                                Image(systemName: "person.crop.circle.badge.plus")
                                    .font(.title)
                                    .frame(width:30,height: 30)
                                    .accessibility(label: Text("我的"))
                                    .accessibility(hint: Text("前往自我账户管理"))
                            }
                    })
                
                
                
                
                
            }
            
            
            
            
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




struct NotificationView: View {
    @ObservedObject var channel : ChannelList
    var body: some View {
        ZStack{
            Rectangle().fill(Color.white).cornerRadius(20).padding(.all,1).overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)),lineWidth: 1)).padding(.horizontal).opacity(0.7).blendMode(.difference).shadow(radius: 1)
            Rectangle().fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8345462329))).cornerRadius(20).padding(.horizontal).padding(.top,45).padding([.horizontal, .bottom],4).opacity(0.9)
            VStack(spacing: 4.0) {
                HStack{
                    Image(channel.portrait).renderingMode(.original).resizable()
                        .scaledToFit()
                        .frame(width:60,height: 60)
                        .overlay( Path(roundedRect: CGRect(x: 0, y: 0, width: 60, height: 60), cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), lineWidth: 5))
                        .background(Color("NameLabelGradientEnd")).cornerRadius(10)
                        .padding(.bottom,3).padding(.leading)
                    Text("\(channel.sender)")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                        .padding( .bottom,5).padding(.leading,6)
                        .overlay(
                            
                            Path(roundedRect: CGRect(x: -3, y: -5, width: 120, height: 30), cornerRadius: 20).stroke(Color.white, lineWidth: 3)
                    ).background(Path(roundedRect: CGRect(x: -3, y: -5, width: 120, height: 30), cornerRadius: 20).fill(LinearGradient(gradient: Gradient(
                        colors: [Color("BackgroundGradient"),Color("NameLabelGradientEnd")]),
                                                                                                                                       startPoint: .topLeading,
                                                                                                                                       endPoint: .bottomTrailing)).opacity(0.9).blur(radius: 5)).padding(.leading,7)
                    
                    Spacer()
                    
                }.padding(.horizontal).padding(.top,10)
                
                HStack{
                    Spacer()
                    if(channel.getNum(mode: .Event)>0){
                        Itemnum(logo: "calendar",count: channel.getNum(mode: .Event))
                        Spacer()
                    }
                    
                    if(channel.getNum(mode: .Task)>0){
                        Itemnum(logo: "hammer",count:  channel.getNum(mode: .Task))
                        Spacer()
                    }
                    if(channel.getNum(mode: .Tip)>0){
                        Itemnum(logo: "lightbulb",count:  channel.getNum(mode: .Tip))
                        Spacer()
                    }
                    
                    
                    
                }.padding(.horizontal, 37.0)
            }.padding(.all,9)
        }
        
        
    }
}



struct Itemnum: View {
    @State var logo:String
    @State var count:Int
    let offset : CGPoint = CGPoint(x: 22, y: -17)
    var body: some View {
        ZStack{
            
            
            
            Image(systemName: self.logo).background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                
                .frame(width: 10.0, height: 10.0)
                .font(.body).foregroundColor(Color.blue)
                .padding(.all, 15.0).background(Color.white).cornerRadius(40)
            .shadow(radius: 1)
                .overlay( ZStack {
                    Circle().fill(Color.red).frame(width: 25.0, height: 25.0).offset(x:self.offset.x,y:self.offset.y)
                    Text("\(self.count)").font(.footnote).foregroundColor(Color.white).offset(x:self.offset.x,y:self.offset.y)
                    Circle().stroke(Color.white,lineWidth: 2).frame(width: 25.0, height: 25.0).offset(x:self.offset.x,y:self.offset.y)
                })
            
            
            
            
            
            
            
        }
        .frame(width: 60.0, height: 60.0)
    }
}
struct EditGalleryEventItem: View {
     @State var info : [String]
    var body : some View {
        VStack {
            EditGalleryItemMenu(imageName: "calendar")
            GalleryEventInfo(info: self.info)
        }.background(RoundedRectangle(cornerRadius: 25).fill(Color.white).opacity(0.5).blur(radius: 3).shadow(radius: 4).overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(#colorLiteral(red: 0.6862745098, green: 0.6980392157, blue: 0.9137254902, alpha: 1)),lineWidth: 2))).padding(.horizontal)
    }
}
struct EditGalleryTaskItem: View {
    @State var info : [String]
    var body : some View {
        VStack {
            EditGalleryItemMenu(imageName: "hammer")
            GalleryTaskInfo(info: self.info)
        }.background(RoundedRectangle(cornerRadius: 25).fill(Color.white).opacity(0.5).blur(radius: 3).shadow(radius: 4).overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(#colorLiteral(red: 0.6862745098, green: 0.6980392157, blue: 0.9137254902, alpha: 1)),lineWidth: 2))).padding(.horizontal)
    }
}
struct EditGalleryTipItem: View {
     @State var info : [String]
    var body : some View {
        VStack {
            EditGalleryItemMenu(imageName: "lightbulb")
            GalleryTipInfo(info: self.info)
        }.background(RoundedRectangle(cornerRadius: 25).fill(Color.white).opacity(0.5).blur(radius: 3).shadow(radius: 4).overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(#colorLiteral(red: 0.6862745098, green: 0.6980392157, blue: 0.9137254902, alpha: 1)),lineWidth: 2))).padding(.horizontal)
    }
}
struct EditGalleryItemMenu : View {
    let width : CGFloat =  30.0
    let height : CGFloat =  30.0
    @State var imageName : String
    var body : some View{
        HStack{
            Image( systemName: "\(imageName)").frame(width: 40.0, height: 40.0).font(.title).foregroundColor(.blue)
            Spacer()
            Button(action: {}){
                Image(systemName: "pencil").frame(width: self.width, height: self.height).font(.body).background(Circle().fill(Color.white).frame(width: self.width, height: self.height).shadow(radius: 3))
            }.padding(.horizontal,3)
            
            Button(action: {}){
                Image(systemName: "trash").frame(width: self.width, height: self.height).font(.body).background(Circle().fill(Color.white).frame(width: self.width, height: self.height).shadow(radius: 3))
            }.padding(.horizontal,3).padding(.trailing,3)
        }.accentColor(Color.blue).padding([.horizontal,.top])
    }
}
extension ContentView {
    
}

struct SearchField: View {
    @Binding var SearchKey : String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass").font(.headline).padding(.leading,5)
            TextField("搜索",text: self.$SearchKey).font(.body).padding(.all,5)
        }.background(RoundedRectangle(cornerRadius: 8).fill(Color.white).opacity(0.1).blendMode(.difference)).overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.white,lineWidth: 2)).opacity(0.6).cornerRadius(8).padding(.horizontal)
    }
}
