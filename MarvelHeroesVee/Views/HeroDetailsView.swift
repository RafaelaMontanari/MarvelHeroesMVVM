//
//  HeroDetailsView.swift
//  MarvelHeroesVee
//
//  Created by Rafaela da Silva Cunha Montanari on 13/12/20.
//

import SwiftUI

struct HeroDetailsView: View {
    
    let id: Int
    
    @ObservedObject var heroDetailVM = HeroDetailViewModel()
    
    var body: some View {
        VStack {
            Text("Hello")
//            if heroDetailVM.loadingState == .success {
//                HeroView(heroDetailVM: heroDetailVM)
//            } else if heroDetailVM.loadingState == .failed {
//                FailedView()
//            }
        }
        .onAppear{
            self.heroDetailVM.getDetailsByHeroId(id: self.id)
        }
    }
}

//struct HeroDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        HeroDetailsView()
//    }
//}
