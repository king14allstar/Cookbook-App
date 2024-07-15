//
//  RecipeDetailView.swift
//  Cookcademy
//
//  Created by Kingston Bems on 4/3/24.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        VStack {
            HStack {
                Text("Author: \(recipe.mainInformation.author)")
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            HStack {
                Text(recipe.mainInformation.description)
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            List {
                Section(header: Text("Ingredients")) {
                    ForEach(recipe.ingredients.indices, id: \.self) { index in
                       let ingredients = recipe.ingredients[index]
                        Text(ingredients.description)
                            .foregroundColor(listTextColor)
                    }
                } .listRowBackground(listBackgroundColor)
                Section(header: Text("Directions")) {
                    ForEach(recipe.directions.indices, id: \.self) { index in
                        let directions = recipe.directions[index]
                        HStack {
                            Text("\(index + 1).").bold()
                            Text("\(directions.isOptional ? "(Optional)" : "")" + "\(directions.description)")
                        } .foregroundColor(listTextColor)
                    }
                } .listRowBackground(listBackgroundColor)
            }
        }
        .navigationTitle(recipe.mainInformation.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    @State static var recipe = Recipe.testRecipes[0]
    static var previews: some View {
        NavigationView{
            RecipeDetailView(recipe: recipe)
        }
    }
}


