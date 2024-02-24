import SwiftUI

struct FeedingGameView: View {
    @State private var roundNumber: Int = 1
    @State private var isHappy: Bool = true
    @State private var selectedFood: String?
    @State private var score: Int = 0

    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.green,],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
            VStack {
                 Spacer()
                AvatarView(isHappy: isHappy)
                    .padding()
                
                Text("I am hungry! Feed me.")
                    .font(.headline)
                    .padding()
                
                Text("Round \(roundNumber) of 5")
                    .font(.subheadline)
                    .padding()
                
                HStack {
                            ImageFeedButton(imageName: "Apple", isSelected: selectedFood == "Good Food", action: {
                                   feedAvatar(foodType: "Good Food")
                               })

                               ImageFeedButton(imageName: "chocolate", isSelected: selectedFood == "Bad Food", action: {
                                   feedAvatar(foodType: "Bad Food")
                               })
                           }

                
                Spacer()
                
                if roundNumber <= 5 {
                    Button(action: {
                        nextRound()
                    }) {
                        Text("Next Round")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(selectedFood != nil ? Color.green : Color.gray)
                            .cornerRadius(10)
                    }
                    .padding()
                } else {
                    Text("Game Over! Your Score: \(score) out of 5")
                        .font(.headline)
                        .padding()
                }
            }
            .padding()
        }
    }

    private func feedAvatar(foodType: String) {
        if foodType == "Good Food" {
            isHappy = true
            score += 1
        } else {
            isHappy = false
        }

        selectedFood = foodType
    }

    private func nextRound() {
        roundNumber += 1
        selectedFood = nil
        isHappy = true
    }
}

struct ImageFeedButton: View {
    let imageName: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .background(isSelected ? Color.green : Color.red)
                .cornerRadius(10)
        }
        .padding()
    }
}

struct AvatarView: View {
    let isHappy: Bool

    var body: some View {
        Text(isHappy ? "😊" : "😢")
            .font(.system(size: 50))
    }
}

struct FeedingGameView_Previews: PreviewProvider {
    static var previews: some View {
        FeedingGameView()
    }
}
