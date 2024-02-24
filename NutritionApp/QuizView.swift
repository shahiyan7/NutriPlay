import SwiftUI

struct Question {
    let text: String
    let choices: [String]
    let correctAnswer: String
}

struct NutritionQuizView: View {
    let questions: [Question] = [
           Question(
               text: "Which nutrient is known as the body's main source of energy?",
               choices: ["Protein", "Carbohydrates", "Fat", "Vitamins"],
               correctAnswer: "Carbohydrates"
           ),
           Question(
               text: "What is the function of Vitamin C?",
               choices: ["Bone health", "Iron absorption", "Wound healing", "Vision"],
               correctAnswer: "Wound healing"
           ),
           Question(
               text: "Which food is a good source of calcium?",
               choices: ["Broccoli", "Banana", "Chicken", "Milk"],
               correctAnswer: "Milk"
           ),
           Question(
               text: "What is the primary function of fiber in the diet?",
               choices: ["Muscle building", "Digestion", "Energy production", "Blood clotting"],
               correctAnswer: "Digestion"
           ),
           Question(
               text: "Which mineral is essential for the formation of red blood cells?",
               choices: ["Calcium", "Iron", "Zinc", "Potassium"],
               correctAnswer: "Iron"
           ),
           Question(
               text: "What is the recommended daily intake of water for adults?",
               choices: ["1 liter", "2 liters", "3 liters", "4 liters"],
               correctAnswer: "2 liters"
           ),
           Question(
               text: "Which of the following is a good source of omega-3 fatty acids?",
               choices: ["Olive oil", "Salmon", "Avocado", "Peanuts"],
               correctAnswer: "Salmon"
           ),
           Question(
               text: "What is the role of Vitamin D in the body?",
               choices: ["Bone health", "Energy production", "Blood clotting", "Wound healing"],
               correctAnswer: "Bone health"
           ),
           Question(
               text: "Which nutrient is the body's primary building block for tissues and muscles?",
               choices: ["Carbohydrates", "Protein", "Fat", "Vitamins"],
               correctAnswer: "Protein"
           ),
           Question(
               text: "What is the primary function of Vitamin A?",
               choices: ["Vision", "Wound healing", "Energy production", "Iron absorption"],
               correctAnswer: "Vision"
           )
       ]

    @State private var currentQuestionIndex: Int = 0
       @State private var selectedAnswers: [String?] = Array(repeating: nil, count: 10)
       @State private var showResult: Bool = false

       var body: some View {
           NavigationView {
               ZStack{
                   LinearGradient(colors: [Color.green,],
                                  startPoint: .topLeading,
                                  endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
                   VStack {
                       Text("Nutrition Quiz")
                           .font(.title)
                           .foregroundColor(.white)
                       Text("Question \(currentQuestionIndex + 1)/10")
                           .font(.headline)
                           .padding()

                       QuestionCardView(question: questions[currentQuestionIndex], selectedAnswer: $selectedAnswers[currentQuestionIndex])
                           .padding()
                           .background(Color.white)
                           .cornerRadius(15)
                           .shadow(radius: 5)

                       Spacer()

                       Button(action: {
                           nextQuestion()
                       }) {
                           Text(currentQuestionIndex == 9 ? "Submit" : "Next Question")
                               .font(.headline)
                               .foregroundColor(.black)
                               .padding()
                               .background(currentQuestionIndex == 9 ? Color.yellow : (selectedAnswers[currentQuestionIndex] != nil ? Color.yellow : Color.white))
                               .cornerRadius(10)
                       }
                       .padding()
                   }
                   .padding()
                   if showResult {
                                  ScoreCardView(score: calculateCorrectAnswers())
                                      .padding()
                                      .background(Color.white)
                                      .cornerRadius(15)
                                      .shadow(radius: 5)
                              }
                          }
                          .background(Color.blue.edgesIgnoringSafeArea(.all))
                      }
                  }


       private func nextQuestion() {
           if currentQuestionIndex == 9 {
               showResult = true
           } else {
               currentQuestionIndex += 1
           }
       }

       private func calculateCorrectAnswers() -> Int {
           var correctCount = 0
           for (index, question) in questions.enumerated() {
               if let selectedAnswer = selectedAnswers[index], selectedAnswer == question.correctAnswer {
                   correctCount += 1
               }
           }
           return correctCount
       }
   }

   struct QuestionCardView: View {
       let question: Question
       @Binding var selectedAnswer: String?

       var body: some View {
           VStack(alignment: .leading, spacing: 20) {
               Text(question.text)
                   .font(.headline)
                   .foregroundColor(.black)

               ForEach(question.choices, id: \.self) { choice in
                   Button(action: {
                       selectedAnswer = choice
                   }) {
                       HStack {
                           Image(systemName: selectedAnswer == choice ? "checkmark.circle.fill" : "circle")
                               .foregroundColor(selectedAnswer == choice ? .green : .gray)
                           Text(choice)
                               .foregroundColor(.black)
                       }
                       .padding()
                       .background(Color.white)
                       .cornerRadius(10)
                   }
               }
           }
       }
   }



struct ScoreCardView: View {
    let score: Int
    @Environment(\.presentationMode) var presentationMode


    var body: some View {
        VStack {
            Text("Quiz Completed!")
                .font(.title)
                .foregroundColor(.black)
                .padding()

            Text("Your Score: \(score) out of 10")
                .font(.headline)
                .padding()

            if score > 7 {
                Text("Excellent!")
                    .font(.headline)
                    .foregroundColor(.green)
                    .padding()

                Text("🎉")
                    .font(.system(size: 30))
                    .padding()
            } else if score > 5 {
                Text("Good, but try to improve.")
                    .font(.headline)
                    .foregroundColor(.orange)
                    .padding()
                Text("😊") // Add normal emoji
                    .font(.system(size: 30))
                    .padding()
            } else {
                Text("Learn more.")
                    .font(.headline)
                    .foregroundColor(.red)
                    .padding()

                Text("😢")
                    .font(.system(size: 30))
                    .padding()
            }
                 NavigationLink(destination: HomeView()) {
                           Text("OK")
                               .font(.headline)
                               .foregroundColor(.white)
                               .padding()
                               .background(Color.blue)
                               .cornerRadius(10)
                       }
                       .padding()
                   }
               }
           }
   struct NutritionQuizView_Previews: PreviewProvider {
       static var previews: some View {
           NavigationView {
               NutritionQuizView()
           }
       }
   }
