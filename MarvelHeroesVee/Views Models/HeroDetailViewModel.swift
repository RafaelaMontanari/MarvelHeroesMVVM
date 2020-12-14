//
//  HeroDetailViewModel.swift
//  MarvelHeroesVee
//
//  Created by Rafaela da Silva Cunha Montanari on 13/12/20.
//

import Foundation

class HeroDetailViewModel : ViewModelBase {
    
    private var heroDetail: Hero?
    
    private var marvelAPI = MarvelAPI()
    
    init(heroDetail: Hero? = nil) {
        self.heroDetail = heroDetail
    }
    
    
    func getDetailsByHeroId(id: Int) {
        
        marvelAPI.getHeroDetailsBy(id: id) { result in
            switch result {
                case .success(let details):
                    DispatchQueue.main.async {
                        self.heroDetail = details
                        self.loadingState = .success
                    }
                
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
                   
            }
        }
    }
    
    var id: Int {
        self.heroDetail?.id ?? 0
    }
    
    var title: String {
        self.heroDetail?.name ?? ""
    }
    
    var description: String {
        self.heroDetail?.description ?? ""
    }
    
//    var thumbnail: Thumbnail {
//        self.heroDetail?.thumbnail ?? Thumbnail
//    }
}
