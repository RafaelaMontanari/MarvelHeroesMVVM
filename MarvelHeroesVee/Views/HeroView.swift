//
//  HeroView.swift
//  MarvelHeroesVee
//
//  Created by Rafaela da Silva Cunha Montanari on 13/12/20.
//

import SwiftUI

struct HeroView: View {
    
    let heroDetailVM: HeroDetailViewModel
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 10) {
//                URLImage(url: heroDetailVM.poster)
//                    .cornerRadius(10)
//                
                Text(heroDetailVM.title)
                    .font(.title)
                Text(heroDetailVM.description)
                Spacer()
            }.padding()
                
            .navigationBarTitle(self.heroDetailVM.title)
        }
    }
}

//struct HeroView_Previews: PreviewProvider {
//    static var previews: some View {
//        return HeroView(heroDetailVM: HeroDetailViewModel(heroDetail: heroDetail))
//    }
//}
