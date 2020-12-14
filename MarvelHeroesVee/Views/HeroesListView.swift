//
//  HeroesListView.swift
//  MarvelHeroesVee
//
//  Created by Rafaela da Silva Cunha Montanari on 12/12/20.
//

import SwiftUI
import KingfisherSwiftUI

struct HeroesListView: View {
    
    let heroes: [Hero]
    
    var body: some View {
        List(self.heroes, id: \.id) {hero in
//            NavigationLink(destination: HeroDetailsView(id: hero.id)) {
                HeroCell(hero: hero)
//            }
        }
    }
}

struct HeroCell: View {
    
    let hero: Hero
    
    var body: some View {
        HStack(alignment: .top) {
            let url = hero.thumbnail.path + "." + hero.thumbnail.ext
            URLImage(url: url)
                .frame(width: 100, height: 120)
                .cornerRadius(6)
            VStack(alignment: .leading) {
                Text(hero.name)
                    .font(.headline)
                
                Text(hero.description)
                    .opacity(0.5)
                    .padding(.top, 10)
            }.padding(5)
            Spacer()
        }.contentShape(Rectangle())
    }
}
