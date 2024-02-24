import SwiftUI
let sampleRecipes = [
    Recipe(name: "Waffles", imageName: "waffles", ingredients: ["Pasta", "Tomato Sauce", "Cheese"]),
    Recipe(name: "Pizza", imageName: "pizza", ingredients: ["Pizza Dough", "Tomato Sauce", "Cheese", "Toppings"]),
    Recipe(name: "Cake", imageName: "cake", ingredients: ["Pasta", "Tomato Sauce", "Cheese"]),
    Recipe(name: "juice", imageName: "watermelonJuice", ingredients: ["Pasta", "Tomato Sauce", "Cheese"]),
    Recipe(name: "Salat", imageName: "salat", ingredients: ["Pasta", "Tomato Sauce", "Cheese"]),
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
