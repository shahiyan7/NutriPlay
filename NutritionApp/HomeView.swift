import SwiftUI
let sampleRecipes = [
    Recipe(name: "Waffles", imageName: "waffles", ingredients: ["Pasta", "Tomato Sauce", "Cheese"],recipeSteps: [
        "Mix all dry ingredients in a bowl.",
        "Add milk, oil, eggs, and vanilla extract. Mix until smooth.",
        "Heat waffle iron and pour batter onto it.",
        "Cook until golden brown and crisp.",
        "Serve and enjoy your delicious waffles!"
    ]),
    Recipe(name: "Pizza", imageName: "pizza", ingredients: ["Pizza Dough", "Tomato Sauce", "Cheese", "Toppings"],recipeSteps: [
        "Mix all dry ingredients in a bowl.",
        "Add milk, oil, eggs, and vanilla extract. Mix until smooth.",
        "Heat waffle iron and pour batter onto it.",
        "Cook until golden brown and crisp.",
        "Serve and enjoy your delicious waffles!"
    ]),
    Recipe(name: "Cake", imageName: "cake", ingredients: ["Pasta", "Tomato Sauce", "Cheese"],recipeSteps: [
        "Mix all dry ingredients in a bowl.",
        "Add milk, oil, eggs, and vanilla extract. Mix until smooth.",
        "Heat waffle iron and pour batter onto it.",
        "Cook until golden brown and crisp.",
        "Serve and enjoy your delicious waffles!"
    ]),
    Recipe(name: "juice", imageName: "watermelonJuice", ingredients: ["Pasta", "Tomato Sauce", "Cheese"],recipeSteps: [
        "Mix all dry ingredients in a bowl.",
        "Add milk, oil, eggs, and vanilla extract. Mix until smooth.",
        "Heat waffle iron and pour batter onto it.",
        "Cook until golden brown and crisp.",
        "Serve and enjoy your delicious waffles!"
    ]),
    Recipe(name: "Salat", imageName: "salat", ingredients: ["Pasta", "Tomato Sauce", "Cheese"],recipeSteps: [
        "Mix all dry ingredients in a bowl.",
        "Add milk, oil, eggs, and vanilla extract. Mix until smooth.",
        "Heat waffle iron and pour batter onto it.",
        "Cook until golden brown and crisp.",
        "Serve and enjoy your delicious waffles!"
    ]),
    // Add more sample recipes as needed
]

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(colors: [Color.green,],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
                Image("nutriBackgroun") 
                                    .resizable()
                                    .scaledToFill()
                                    .edgesIgnoringSafeArea(.all)
                                    .opacity(0.5)
                VStack {
                    Spacer()
                    
                    NavigationLink(destination:RecipeListView(recipes:sampleRecipes)) {
                        HomeCardView(systemImage: "book.fill", title: "Recipes")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination:FoodGameView()) {
                        HomeCardView(systemImage: "leaf.fill", title: "Food Game")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination: NutritionQuizView()) {
                        HomeCardView(systemImage: "gamecontroller.fill", title: "Quiz Game")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                }
               
            }
            
        }
    }
}

struct HomeCardView: View {
    let systemImage: String
    let title: String

    var body: some View {
        VStack {
            Image(systemName: systemImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 80)
                .padding()

            Text(title)
                .font(.headline)
                .foregroundColor(.black)
                .padding()
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding()
    }
}






struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
