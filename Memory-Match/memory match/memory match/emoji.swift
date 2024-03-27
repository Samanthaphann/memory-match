//
//  emoji.swift
//  memory match
//
//  Created by StudentAM on 3/21/24.
//

import SwiftUI

struct emoji: View {
    var isFlipped: Bool
    var emoji: String
    var body: some View {
        ZStack{
            //creates the rectangle card that covers emoji
            Rectangle()
                //if it's flipped the blue turns into clear
                .foregroundColor(isFlipped ? Color.clear : Color.blue)
                //sets size
                .frame(width:80, height: 80)
                .cornerRadius(7)
            //if flipped, shows the emoji
            if isFlipped{
                Text("\(emoji)")
                    .frame(width:80, height: 80)
                    .padding()
            }
        }
    }
}

#Preview {
    //shows the preview
    emoji(isFlipped: false, emoji: "")
}
