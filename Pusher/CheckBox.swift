//
//  CheckBox.swift
//  Pusher
//
//  Created by 奚锐的Mac on 2020/8/9.
//  Copyright © 2020 奚锐的Mac. All rights reserved.
//

import SwiftUI

struct CheckBox:  View {
    @State var CheckState : Bool
    var body: some View {
        ZStack{
            Circle().fill(self.CheckState ? Color.blue : Color.white).opacity(self.CheckState ? 1: 0.1)
            Circle().stroke(Color.gray,lineWidth: 1)
            Image(systemName: self.CheckState ?  "checkmark": "").foregroundColor(Color.white).padding(.all,2)
            
        }.onTapGesture {
            self.CheckState.toggle()
        }
    }
}

struct CheckBox_Previews: PreviewProvider {
   @State var state = false
    static var previews: some View {
        CheckBox(CheckState: false)
    }
}
