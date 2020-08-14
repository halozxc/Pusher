//
//  ColorSet.swift
//  Pusher
//
//  Created by 奚锐的Mac on 2020/7/21.
//  Copyright © 2020 奚锐的Mac. All rights reserved.
//

import SwiftUI

struct ColorSet: View {
    var body: some View {
        VStack{
            Rectangle().foregroundColor(Color.red)
            Rectangle().foregroundColor(Color.orange)
            Rectangle().foregroundColor(Color.yellow)
            Rectangle().foregroundColor(Color.green)
            Rectangle().foregroundColor(Color.blue)
            Rectangle().foregroundColor(Color.purple)
            Rectangle().foregroundColor(Color.gray)
            Rectangle().foregroundColor(Color("TestColor"))
            
            
        }
    }
}

struct ColorSet_Previews: PreviewProvider {
    static var previews: some View {
        ColorSet()
    }
}
