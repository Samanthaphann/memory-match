import SwiftUI

struct GameView: View {
    @State var scoreInput: Int = 0
    @State var emojis = ["😀", "😀", "😁", "😁", "😂", "😂", "🤣", "🤣", "😃", "😃", "😄", "😄"].shuffled()
    @State var cardsFlipped: [Bool] = Array(repeating: false, count: 16)
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    @State var selectedEmojis: [String] = []
    @State var matchedIndices: [Int] = []
    @State private var pickOne: Int = -1
    @State private var pickTwo: Int = -1
    
    var body: some View {
        NavigationView {
            ZStack {
                //create circes for background
                Circle()
                    .foregroundColor(Color(red: 9.9, green: 0.8, blue: 0.9))
                    .offset(x: -130, y: -325)
                Circle()
                    .foregroundColor(Color(red: 0.8, green: 0.9, blue: 0.8))
                    .offset(x: 150, y: 320)
                
                VStack {
                    //displays current score
                    Text("Current Score: \(scoreInput)")
                    //custom font
                        .font(.custom("MadimiOne-Regular", size: 40))
                        .padding(.bottom, 50)
                    //makes it so the buttons are displayed in 3 columns
                    LazyVGrid(columns: columns, spacing: 10) {
                        //goes through the butons
                        ForEach(emojis.indices, id: \.self){ index in
                            Button {
                                tappedButton(index)
                                //runs the code when pressing on the button
                            } label: {
                                //check the emoji and card index
                                emoji(isFlipped: cardsFlipped[index], emoji: emojis[index])
                            }
                        }
                        //hides navigation bar
                        .navigationBarHidden(true)
                    }
                    .padding(.bottom, 20)
                    HStack{
                        //if the score is equal or over 6, the next button pops up
                        //directs to the good job page
                        if scoreInput >= 6{
                            NavigationLink(destination: NextView().navigationBarBackButtonHidden(true)) {
                                Text("NEXT")
                                    .padding(.vertical, 15) // Add top and bottom padding
                                    .padding(.horizontal, 25)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                                    .font(.custom("MadimiOne-Regular", size: 35))
                            }
                        }
                        //shuffles emojis when pressing the retry button
                        NavigationLink(destination: GameView().navigationBarBackButtonHidden(true).onAppear {
                            emojis.shuffle()
                        }) {
                            Text("RETRY")
                                .font(.custom("MadimiOne-Regular", size: 35))
                                .padding(.vertical, 15)
                                .padding(.horizontal, 25)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .foregroundColor(.white)                        }

                    }
                    
                }
            }
        }
    }
        func tappedButton(_ index: Int) {

            if pickOne == -1 || pickTwo == -1{
                //if pickone and picktwo are equal to -1, it sets the index to true and updates its
                if pickOne == -1{
                    cardsFlipped[index] = true
                    pickOne = index
                }else if pickTwo == -1{
                    cardsFlipped[index] = true
                    pickTwo = index
                    checkEmoji(pickOne, pickTwo)
                }
            }
        func checkEmoji(_ index1: Int, _ index2: Int){
            //checks if emoji 1 and 2 are the same, if so updates score
            if emojis[pickOne] == emojis[pickTwo]{
                scoreInput += 1
                pickOne = -1
                pickTwo = -1
            } else{
                //index will reset if cards are different
                //adds a timer of 1 second
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    
                    print("DEBUG: Card filped")
                    cardsFlipped[pickOne] = false
                    cardsFlipped[pickTwo] = false
                    
                    pickOne = -1
                    pickTwo = -1
                    
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
