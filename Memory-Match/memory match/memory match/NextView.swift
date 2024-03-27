//
//  NextView.swift
//  memory match
//
//  Created by StudentAM on 3/26/24.
//

import SwiftUI

struct NextView: View {
    var body: some View {
        NavigationView{
            ZStack {
                //Creates circle
                Circle()
                    .foregroundColor(Color(red: 9.9, green: 0.8, blue: 0.9))
                .offset(x: -130, y: -325)
                Circle()
                    .foregroundColor(Color(red: 0.8, green: 0.9, blue: 0.8))
                    .offset(x: 150, y: 320)
                VStack{
                    Text("😃")
                        .font(.system(size: 200))
                    Text("Great Job!")
                        .font(.system(size: 40))
                    
                    //directs back to the start page
                    NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
                        Text("PLAY AGAIN")
                            .multilineTextAlignment(.center)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .frame(width: 300, height: 60)
                            .font(.custom("MadimiOne-Regular", size: 50))
                    }
                }
            }
        }
    }
}
#Preview {
    NextView()
}
