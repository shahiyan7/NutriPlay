import SwiftUI
let sampleRecipes = [
    Recipe(name: "Waffles", imageName: "waffles", ingredients: ["Pasta", "Tomato Sauce", "Cheese"],recipeSteps: [
        "Mix all dry ingredients in a bowl.",
        "Add milk, oil, eggs, and vanilla extract. Mix until smooth.",
        "Heat waffle iron and pour batter onto it.",
        "Cook until golden brown and crisp.",
        "Serve and enjoy your delicious waffles!"
    ]),
    Recipe(name: "Pizza", imageName: "pizza", ingredients: ["Pizza Dough", "Tomato Sauce", "Cheese", "Toppings"], recipeSteps: [
        "Preheat the oven to the recommended temperature for your pizza dough.",
        "Roll out the pizza dough on a floured surface.",
        "Spread tomato sauce evenly over the dough, leaving a small border for the crust.",
        "Sprinkle cheese and add your favorite toppings, such as pepperoni or vegetables.",
        "Bake in the preheated oven until the crust is golden and the cheese is melted and bubbly.",
        "Slice and enjoy your homemade pizza!"
    ]),
    Recipe(name: "Cake", imageName: "cake", ingredients:["Flour", "Sugar", "Eggs", "Butter", "Baking Powder", "Milk", "Vanilla Extract"], recipeSteps: [
        "Preheat your oven to the recommended temperature for baking the cake.",
        "In a large mixing bowl, cream together butter and sugar until light and fluffy.",
        "Add eggs one at a time, beating well after each addition.",
        "In a separate bowl, whisk together flour and baking powder.",
        "Gradually add the dry ingredients to the wet ingredients, alternating with milk. Mix until well combined.",
        "Stir in vanilla extract for flavor.",
        "Pour the batter into a greased and floured cake pan.",
        "Bake in the preheated oven until a toothpick inserted into the center comes out clean.",
        "Allow the cake to cool, then frost and decorate as desired.",
        "Slice and enjoy your delicious cake!"
    ]),
    Recipe(name: "juice", imageName: "watermelonJuice", ingredients:["Watermelon", "Ice Cubes (optional)"], recipeSteps: [
        "Cut the watermelon into small cubes, removing seeds if necessary.",
        "Place the watermelon cubes in a blender.",
        "Blend the watermelon until smooth and juicy.",
        "If desired, add ice cubes to the blender and blend again for a refreshing chill.",
        "Strain the juice to remove any pulp if preferred.",
        "Pour the watermelon juice into glasses.",
        "Garnish with a watermelon slice on the rim if you like.",
        "Serve and enjoy your cool and hydrating watermelon juice!"
    ]),
    Recipe(name: "Salat", imageName: "salat", ingredients:  ["Lettuce", "Tomatoes", "Cucumbers", "Carrots", "Bell Peppers", "Dressing of your choice"], recipeSteps: [
        "Wash and chop all the vegetables into bite-sized pieces.",
        "In a large bowl, combine lettuce, tomatoes, cucumbers, carrots, and bell peppers.",
        "Toss the vegetables together until evenly mixed.",
        "Add your favorite dressing and toss again to coat the salad.",
        "Adjust seasoning according to your taste.",
        "Serve the refreshing salad immediately.",
        "Enjoy a healthy and delicious bowl of salad!"
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
