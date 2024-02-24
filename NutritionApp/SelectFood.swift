import SwiftUI

struct Questions {
    let text: String
    let choices: [FoodOption]
    let correctAnswer: FoodOption
}

struct FoodOption: Identifiable, Equatable  {
    let id = UUID()
    let name: String
    let imageName: String
}

struct FoodGameView: View {
    let questions: [Questions] = [
        Questions(
            text: "Which food group helps you grow and gives you energy?",
            choices: [
                FoodOption(name: "Vegetables", imageName: "broccoli"),
                FoodOption(name: "Candy", imageName: "candy"),
                FoodOption(name: "Toys", imageName: "toys"),
                FoodOption(name: "Soda", imageName: "soda")
            ],
            correctAnswer: FoodOption(name: "Vegetables", imageName: "broccoli")
        ),
        Questions(
            text: " What vitamin do you get from sunlight to make your bones strong?",
            choices: [
                FoodOption(name: "Vitamin C", imageName: "vitaminC"),
                FoodOption(name: "Vitamin D", imageName: "VitaminD"),
                FoodOption(name: "Vitamin A", imageName: "VitaminA"),
                FoodOption(name: "Vitamin B", imageName: "VitaminB")
            ],
            correctAnswer: FoodOption(name: "Vitamin D", imageName: "VitaminD")
        ),
        Questions(
            text: "Which fruit is known as the king of fruits?",
            choices: [
                FoodOption(name: "Banana", imageName: "banana"),
                FoodOption(name: "Apple", imageName: "Apple"),
                FoodOption(name: "Mango", imageName: "mango"),
                FoodOption(name: "Orange", imageName: "orange")
            ],
            correctAnswer: FoodOption(name: "Mango", imageName: "mango")
        ),
        Questions(
            text: "What should you drink to keep your body hydrated?",
            choices: [
                FoodOption(name: "Fruit juice", imageName: "FruitJuice"),
                FoodOption(name: "Soda", imageName: "soda"),
                FoodOption(name: "Water", imageName: "water"),
                FoodOption(name: "Ice cream", imageName: "iceCream")
            ],
            correctAnswer: FoodOption(name: "Salmon", imageName: "salmon")
        ),
        Questions(
            text: "Which food is good for your eyesight?",
            choices: [
                FoodOption(name: "Carrots", imageName: "carrots"),
                FoodOption(name: "Pizza", imageName: "pizza"),
                FoodOption(name: "Chips", imageName: "chips"),
                FoodOption(name: "Chocolate", imageName: "chocolate")
            ],
            correctAnswer: FoodOption(name: "Carrots", imageName: "salmon")
        ),
        Questions(
            text: "What food helps you build strong muscles and repair your body?",
            choices: [
                FoodOption(name: "Ice cream", imageName: "iceCream"),
                FoodOption(name: "Broccoli", imageName: "broccoli"),
                FoodOption(name: "French fries", imageName: "Fries"),
                FoodOption(name: "Cake", imageName: "cake")
            ],
            correctAnswer: FoodOption(name: "Broccoli", imageName: "broccoli")
        ),
        Questions(
            text: "Which food is a good source of fiber and helps with digestion?",
            choices: [
                FoodOption(name: "Pizza", imageName: "pizza"),
                FoodOption(name: "Candy", imageName: "candy"),
                FoodOption(name: "Broccoli", imageName: "broccoli"),
                FoodOption(name: "Soda", imageName: "soda")
            ],
            correctAnswer: FoodOption(name: "Broccoli", imageName: "cheese")
        ),
        Questions(
            text: "Which snack is a healthy option for your brain?",
            choices: [
                FoodOption(name: "Potato chips", imageName: "chips"),
                FoodOption(name: "Nuts", imageName: "nuts"),
                FoodOption(name: "Candy", imageName: "candy"),
                FoodOption(name: "Cookies", imageName: "cookies")
            ],
            correctAnswer: FoodOption(name: "Nuts", imageName: "nuts")
        ),
        Questions(
            text: "Which dairy product is good for your bones?",
            choices: [
                FoodOption(name: "Ice cream", imageName: "iceCream"),
                FoodOption(name: "Cheese", imageName: "cheese"),
                FoodOption(name: "Chocolate milk", imageName: "chocolate1"),
                FoodOption(name: "Milkshake", imageName: "milkshake")
            ],
            correctAnswer: FoodOption(name: "Cheese", imageName: "cheese")
        ),
        Questions(
            text: "What is the main ingredient in making a sandwich?",
            choices: [
                FoodOption(name: "Ice cream", imageName: "iceCream"),
                FoodOption(name: "Bread", imageName: "bread"),
                FoodOption(name: "Chocolate", imageName: "chocolate"),
                FoodOption(name: "Cookies", imageName: "cookies")
            ],
            correctAnswer: FoodOption(name: "Bread", imageName: "bread")
        ),
        // Add more questions and options as needed
    ]

    @State private var currentQuestionIndex: Int = 0
    @State private var selectedAnswer: FoodOption?
    @State private var score: Int = 0

    var body: some View {
        VStack {
            Spacer()
            Text("Question \(currentQuestionIndex + 1)/10")
                .font(.headline)
                .padding()

            Text(questions[currentQuestionIndex].text)
                .font(.system(size: 25))
                .padding()

                      HStack {
                           ForEach(questions[currentQuestionIndex].choices.prefix(2), id: \.name) { choice in
                               FoodButton(foodOption: choice, isSelected: selectedAnswer == choice, action: {
                                   selectAnswer(choice)
                               })
                           }
                       }

                       HStack {
                           ForEach(questions[currentQuestionIndex].choices.suffix(2), id: \.name) { choice in
                               FoodButton(foodOption: choice, isSelected: selectedAnswer == choice, action: {
                                   selectAnswer(choice)
                               })
                           }
                       }
            Spacer()

            Button(action: {
                nextQuestion()
            }) {
                Text(currentQuestionIndex == 9 ? "Submit" : "Next Question")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
                    .background(selectedAnswer != nil ? Color.yellow : Color.white)
                    .cornerRadius(10)
            }
           Spacer()

            if currentQuestionIndex == 9 {
                Text("Score: \(score) out of 10")
                    .font(.headline)
                    .padding()
            }
        }
        .padding()
        .background(Color.green)
        .edgesIgnoringSafeArea(.all)
    }

    private func selectAnswer(_ choice: FoodOption) {
        selectedAnswer = choice
    }

    private func nextQuestion() {
        if let selected = selectedAnswer {
            if selected == questions[currentQuestionIndex].correctAnswer {
                score += 1
            }
        }

        if currentQuestionIndex < 9 {
            currentQuestionIndex += 1
            selectedAnswer = nil
        }
    }
}

struct FoodButton: View {
    let foodOption: FoodOption
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            Image(foodOption.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 140, height: 140)
                .background(Color.white)
                .border(isSelected ? Color.yellow : Color.white, width: 2)
                .cornerRadius(10)
        }
        .padding()
    }
}

struct FoodGameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FoodGameView()
        }
    }
}
