import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Image("IMG_0634")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Emoji Match")
                        .font(.custom("MadimiOne-Regular", size: 50))
                        .multilineTextAlignment(.center)
                        .frame(width: 300, height: 115)
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .cornerRadius(10)
                        .padding(.bottom, 290)
                    NavigationLink(destination: GameView().navigationBarBackButtonHidden(true)) {
                        Text("START")
                            .font(.custom("MadimiOne-Regular", size: 50))
                            .multilineTextAlignment(.center)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .frame(width: 200, height: 60)
                    }
                }
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
