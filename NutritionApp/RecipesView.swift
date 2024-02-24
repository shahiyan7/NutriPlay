import SwiftUI

struct Recipe: Identifiable {
    let id: UUID
    let name: String
    let imageName: String
    let ingredients: [String]

    init(name: String, imageName: String, ingredients: [String]) {
        self.id = UUID()
        self.name = name
        self.imageName = imageName
        self.ingredients = ingredients
    }
}

struct RecipeListView: View {
    let recipes: [Recipe]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(recipes) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            RecipeCardView(recipe: recipe)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            .background(Color.green) // Recipe page background color
        }
    }
}

struct RecipeCardView: View {
    let recipe: Recipe

    var body: some View {
        VStack {
            Image(recipe.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 150)
                .cornerRadius(10)
                .shadow(radius:5,y: 10)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(Color.gray, lineWidth: 1)
//                )

            Text(recipe.name)
                .font(.headline)
                .foregroundColor(.black)
                .padding()
                .cornerRadius(10)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(Color.gray, lineWidth: 1)
//                )
        }
        .frame(width: 200, height: 200)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding(.bottom,20)
    }
}



struct RecipeDetailView: View {
    let recipe: Recipe

    var body: some View {
        VStack {
            Image(recipe.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
                .cornerRadius(10)
                .padding()

            Text(recipe.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()

            Text("Ingredients: \(recipe.ingredients.joined(separator: ", "))")
                .font(.body)
                .foregroundColor(.white)
                .padding()

            // Add more details or content as needed
        }
        .navigationBarTitle(recipe.name)
        .background(Color.green) // Detail view background color
    }
}

struct YourNewPreviewProvider: PreviewProvider {
    static var previews: some View {
        let sampleRecipes = [
            Recipe(name: "Waffles", imageName: "waffles", ingredients: ["Pasta", "Tomato Sauce", "Cheese"]),
            Recipe(name: "Pizza", imageName: "pizza", ingredients: ["Pizza Dough", "Tomato Sauce", "Cheese", "Toppings"]),
            Recipe(name: "Cake", imageName: "cake", ingredients: ["Pasta", "Tomato Sauce", "Cheese"]),
            Recipe(name: "juice", imageName: "watermelonJuice", ingredients: ["Pasta", "Tomato Sauce", "Cheese"]),
            Recipe(name: "Salat", imageName: "salat", ingredients: ["Pasta", "Tomato Sauce", "Cheese"]),
            // Add more sample recipes as needed
        ]

        return RecipeListView(recipes: sampleRecipes)
    }
}


