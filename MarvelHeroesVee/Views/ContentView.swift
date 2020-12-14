//
//  ContentView.swift
//  MarvelHeroesVee
//
//  Created by Rafaela da Silva Cunha Montanari on 12/12/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var heroesListVM: HeroesListViewModel
    //este objeto está sendo observado, sendo assim, se houver mudanças a view será renderizada.
    
    @State var name: String = ""
    
    init() {
        self.heroesListVM = HeroesListViewModel()
        //self.heroesListVM.search(name: "", page: 1)
    }
    
    var body: some View {
        VStack{
            TextField("Digite o nome do herói", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
            Button(action: {
                self.heroesListVM.heroes = []
                self.heroesListVM.search(name: self.name, page: 0)
            }) {
                HStack {
                    Image(systemName: "find")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Text("Buscar")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.title)
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            .foregroundColor(.white)
            .background(Color.red)
            .cornerRadius(40)
            Spacer()
            HeroesListView(heroes: self.heroesListVM.heroes)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
