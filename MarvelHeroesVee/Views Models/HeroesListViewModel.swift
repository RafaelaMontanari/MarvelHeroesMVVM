//
//  HeroesListViewModel.swift
//  MarvelHeroesVee
//
//  Created by Rafaela da Silva Cunha Montanari on 12/12/20.
//

import Foundation

class HeroesListViewModel: ObservableObject {
    
    @Published var heroes: [Hero] = []
    var loadingHeroes = false
    var currentPage = 0
    var total = 0
    
    let marvelAPI = MarvelAPI()
    
    func search(name: String? ,page: Int){
        marvelAPI.loadHeroes(name: name, page: currentPage) { (info) in
            if let info = info {
                self.heroes += info.data.results
                self.total = info.data.total
                print("Total: ", self.total, "já incluídos: ", self.heroes.count)
                DispatchQueue.main.async {
                    self.loadingHeroes = false
                    //self.label.text = "Não foram encontrados heróis com o nome \(self.name!)."
                    //self.tableView.reloadData()
                }
            }
        }
    }
}
